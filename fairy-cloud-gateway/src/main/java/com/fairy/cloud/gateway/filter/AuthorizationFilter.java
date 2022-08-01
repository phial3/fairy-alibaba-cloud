package com.fairy.cloud.gateway.filter;

import com.alibaba.fastjson.JSON;
import com.fairy.cloud.gateway.properties.NotAuthUrlProperties;
import com.fairy.cloud.gateway.utils.KeyPairUtil;
import com.fairy.cloud.gateway.utils.TokenUtils;
import com.fairy.common.constants.RedisKeyPrefixConst;
import com.fairy.common.enums.ResultEnums;
import com.fairy.common.exception.GateWayException;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.security.PublicKey;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * 认证过滤器,根据url判断用户请求是要经过认证 才能访问
 */
@Component
@Slf4j
@EnableConfigurationProperties(value = NotAuthUrlProperties.class)
public class AuthorizationFilter implements GlobalFilter, Ordered, InitializingBean {

/*    @Autowired
    private CloudRestTemplate restTemplate;*/

    @Autowired
    @Qualifier("restTemplate")
    private RestTemplate restTemplate;

    @Autowired
    private KeyPairUtil keyPairUtil;
    /**
     * 请求各个微服务 不需要用户认证的URL
     */
    @Autowired
    private NotAuthUrlProperties notAuthUrlProperties;
    /**
     * jwt的公钥,需要网关启动,远程调用认证中心去获取公钥
     */
    private PublicKey publicKey;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        String currentUrl = exchange.getRequest().getURI().getPath();
        //1:不需要认证的url
        if (shouldSkip(currentUrl)) {
            log.info("跳过认证的URL:{}", currentUrl);
            return chain.filter(exchange);
        }
        log.info("需要认证的URL:{}", currentUrl);
        //第一步:解析出我们Authorization的请求头  value为: “bearer XXXXXXXXXXXXXX”
        String authHeader = exchange.getRequest().getHeaders().getFirst("Authorization");
        //第二步:判断Authorization的请求头是否为空
        if (StringUtils.isEmpty(authHeader)) {
            log.warn("需要认证的url,请求头为空");
            throw new GateWayException(ResultEnums.AUTHORIZATION_HEADER_IS_EMPTY);
        }
        //第三步 校验我们的jwt 若jwt不对或者超时都会抛出异常
        Claims claims = TokenUtils.validateJwtToken(authHeader, publicKey);
        //第四步 把从jwt中解析出来的 用户登陆信息存储到请求头中
        ServerWebExchange webExchange = wrapHeader(exchange, claims);
        if (!hasPremisson(claims, exchange.getRequest().getURI().getPath())) {
            log.error("用户[{}]无权限访问路径[{}]", claims.get("user_name"), currentUrl);
            throw new GateWayException(ResultEnums.FORBIDDEN);
        }

        return chain.filter(webExchange);
    }

    /**
     * 方法实现说明:把我们从jwt解析出来的用户信息存储到请求中
     *
     * @param serverWebExchange
     * @param claims
     * @return: ServerWebExchange
     */
    private ServerWebExchange wrapHeader(ServerWebExchange serverWebExchange, Claims claims) {
        String memberId = claims.get("additionalInfo", Map.class).get("memberId").toString();
        String nickName = claims.get("additionalInfo", Map.class).get("nickName").toString();
        //向headers中放文件，记得build
        ServerHttpRequest request = serverWebExchange.getRequest().mutate()
                .header("username", claims.get("user_name", String.class))
                .header("memberId", memberId)
                .header("nickName", nickName)
                .build();
        //将现在的request 变成 change对象
        return serverWebExchange.mutate().request(request).build();
    }


    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    private boolean hasPremisson(Claims claims, String currentUrl) {
        //获取登陆用户的角色列表  这里查询的只是角色
        List<String> roleNames = claims.get("authorities", List.class);
        //1：查询改角色的url 可以访问的权限
        //2：要么就是把该用户的权限信息都写到jwt里面 但是信息太大 不采用
        //3: redis存储 在登陆成功后把查询出来的用户可以访问的权限写到redis这里只需要查询就可以 但是需要刷新redis
        //4: redis缓存 数据库双写 最终一致性  redis有效时间 时间过后 重新从数据库读取 代码逻辑就不太分工明确
        //5: 直接jwt拿到角色信息  根据角色 获取redis里面的权限信息 （本次采用这种）
        List<String> matchUrls = new LinkedList<>();
        for (String roleName : roleNames) {
            Object value = Optional.ofNullable(redisTemplate.opsForValue().get(RedisKeyPrefixConst.USER_ROLE_PERMISSIOn+":"+roleName));
            matchUrls.addAll(JSON.parseArray(String.valueOf(value), String.class));
        }
        for (String url : matchUrls) {
            if (url.equalsIgnoreCase(currentUrl)) {
                return true;
            }
        }
        return false;
    }


    /**
     * 方法实现说明:不需要授权的路径
     *
     * @param currentUrl 当前请求路径
     * @return:
     */
    private boolean shouldSkip(String currentUrl) {
        //路径匹配器(简介SpringMvc拦截器的匹配器)
        //比如/oauth/** 可以匹配/oauth/token    /oauth/check_token等
        PathMatcher pathMatcher = new AntPathMatcher();
        for (String skipPath : notAuthUrlProperties.getShouldSkipUrls()) {
            if (pathMatcher.match(skipPath, currentUrl)) {
                return true;
            }
        }
        return false;
    }


    @Override
    public int getOrder() {
        return 0;
    }

    /**
     * 方法实现说明:网关服务启动 生成公钥
     *
     * @return:
     */
    @Override
    public void afterPropertiesSet() throws Exception {
        //初始化公钥
        this.publicKey = TokenUtils.genPulicKey(restTemplate);
//        this.publicKey = keyPairUtil.genPulicKey(restTemplate);
    }

}
