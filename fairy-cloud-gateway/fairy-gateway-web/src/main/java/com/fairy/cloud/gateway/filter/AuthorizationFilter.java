package com.fairy.cloud.gateway.filter;

import cn.hutool.core.collection.CollectionUtil;
import com.fairy.cloud.gateway.properties.NotAuthUrlProperties;
import com.fairy.cloud.mbg.mapper.UmsPermissionMapper;
import com.fairy.common.entity.dto.PermissionDTO;
import com.fairy.common.enums.AuthErrorEnum;
import com.fairy.common.error.ServiceException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.jsonwebtoken.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 认证过滤器,根据url判断用户请求是要经过认证 才能访问
 */
@Component
@Slf4j
@ComponentScan(basePackages = "com.fairy.auth.authorication.client")
public class AuthorizationFilter implements GlobalFilter, Ordered {
    private static final String BEARER = "Bearer ";
    private static final String X_CLIENT_TOKEN_USER = "x-client-token-user";
    private static final String X_CLIENT_TOKEN = "x-client-token";
    @Value("${spring.security.oauth2.jwt.signingKey}")
    private String signingKey;
    @Autowired
    private NotAuthUrlProperties properties;
    @Autowired
    private UmsPermissionMapper permissionMapper;

    private AntPathMatcher pathMatcher = new AntPathMatcher();


    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        String authentication = request.getHeaders().getFirst(HttpHeaders.AUTHORIZATION);
        String method = request.getMethodValue();
        String currentUrl = request.getPath().value();
        log.info("url:{},method:{},headers:{}", currentUrl, method, request.getHeaders());
        //1:不需要认证的url
        boolean rs = properties.getShouldSkipUrls().stream().anyMatch(ignoreUrl -> currentUrl.startsWith(StringUtils.trim(ignoreUrl)));
        if (rs) {
            return chain.filter(exchange);
        }
        log.info("需要认证的URL:{}", currentUrl);
        if (StringUtils.isEmpty(authentication)) {
            log.warn("需要认证的url,请求头为空");
            throw new ServiceException(AuthErrorEnum.AUTHORIZATION_HEADER_IS_EMPTY);
        }
        //调用签权服务看用户是否有权限，若有权限进入下一个filter
        if (hasPermission(authentication, currentUrl, method)) {
            ServerHttpRequest.Builder builder = request.mutate();
            //TODO 转发的请求都加上服务间认证token
            builder.header(X_CLIENT_TOKEN, "");
            //将jwt token中的用户信息传给服务
            builder.header(X_CLIENT_TOKEN_USER, getUserToken(authentication));
            return chain.filter(exchange.mutate().request(builder.build()).build());
        }
        return unauthorized(exchange);
    }

    private Boolean hasPermission(String authentication, String url, String method) {
        // 如果请求未携带token信息, 直接权限
        if (StringUtils.isBlank(authentication) || !authentication.startsWith(BEARER)) {
            log.error("user token is null");
            return Boolean.FALSE;
        }
        //token是否有效，在网关进行校验，无效/过期等
        if (invalidJwtAccessToken(authentication)) {
            return Boolean.FALSE;
        }
        //从认证服务获取是否有权限,远程调用
        String userName = Objects.isNull(getJwt(authentication).get("user_name")) ? "" : String.valueOf(getJwt(authentication).get("user_name"));
        //根据用户名查询用户私服有该权限
        List<PermissionDTO> permissionDTOS = permissionMapper.selectPermissionByUserNameAndMethod(userName, method);
        Set<PermissionDTO> sets = Optional.ofNullable(permissionDTOS).get().stream().filter(permissionDTO -> {
            String permissionDTOUrl = permissionDTO.getUrl();
            return permissionDTOUrl.equalsIgnoreCase(url) || pathMatcher.match(permissionDTOUrl, url);
        }).collect(Collectors.toSet());
        if (CollectionUtil.isEmpty(sets)) {
            return false;
        }
        return true;
    }


    private boolean invalidJwtAccessToken(String jwtToken) {
        boolean invalid = Boolean.TRUE;
        try {
            getJwt(jwtToken);
            invalid = Boolean.FALSE;
        } catch (SignatureException | ExpiredJwtException | MalformedJwtException ex) {
            log.error("user token error :{}", ex.getMessage());
            invalid = Boolean.FALSE;
        }
        return invalid;
    }


    /**
     * 提取jwt token中的数据，转为json
     *
     * @param authentication
     * @return
     */
    private String getUserToken(String authentication) {
        String token = "{}";
        try {
            token = new ObjectMapper().writeValueAsString(getJwt(authentication));
            return token;
        } catch (JsonProcessingException e) {
            log.error("token json error:{}", e.getMessage());
        }
        return token;
    }

    private Claims getJwt(String authentication) {
        if (authentication.startsWith(BEARER)) {
            authentication = StringUtils.substring(authentication, BEARER.length());
        }
        return Jwts.parser()  //得到DefaultJwtParser
                .setSigningKey(signingKey.getBytes()) //设置签名的秘钥
                .parseClaimsJws(authentication).getBody();
    }

    /**
     * 网关拒绝，返回401
     *
     * @param
     */
    private Mono<Void> unauthorized(ServerWebExchange serverWebExchange) {
        serverWebExchange.getResponse().setStatusCode(HttpStatus.UNAUTHORIZED);
        DataBuffer buffer = serverWebExchange.getResponse()
                .bufferFactory().wrap(HttpStatus.UNAUTHORIZED.getReasonPhrase().getBytes());
        return serverWebExchange.getResponse().writeWith(Flux.just(buffer));
    }

    @Override
    public int getOrder() {
        return -1;
    }

}
