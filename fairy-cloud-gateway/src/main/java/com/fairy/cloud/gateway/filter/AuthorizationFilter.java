package com.fairy.cloud.gateway.filter;

import com.fairy.auth.authorication.client.service.IAuthService;
import com.fairy.cloud.gateway.service.IPermissionService;
import com.fairy.common.enums.ResultEnums;
import com.fairy.common.exception.GateWayException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * 认证过滤器,根据url判断用户请求是要经过认证 才能访问
 */
@Component
@Slf4j
@ComponentScan(basePackages = "com.fairy.auth.authorication.client")
public class AuthorizationFilter implements GlobalFilter, Ordered {

    private static final String X_CLIENT_TOKEN_USER = "x-client-token-user";
    private static final String X_CLIENT_TOKEN = "x-client-token";

    @Autowired
    private IAuthService authService;

    @Autowired
    private IPermissionService permissionService;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        String authentication = request.getHeaders().getFirst(HttpHeaders.AUTHORIZATION);
        String method = request.getMethodValue();
        String currentUrl = request.getPath().value();
        log.debug("url:{},method:{},headers:{}", currentUrl, method, request.getHeaders());
        //1:不需要认证的url
        if (authService.ignoreAuthentication(currentUrl)) {
            return chain.filter(exchange);
        }
        log.info("需要认证的URL:{}", currentUrl);
        if (StringUtils.isEmpty(authentication)) {
            log.warn("需要认证的url,请求头为空");
            throw new GateWayException(ResultEnums.AUTHORIZATION_HEADER_IS_EMPTY);
        }
        //调用签权服务看用户是否有权限，若有权限进入下一个filter
        if (permissionService.permission(authentication, currentUrl, method)) {
            ServerHttpRequest.Builder builder = request.mutate();
            //TODO 转发的请求都加上服务间认证token
            builder.header(X_CLIENT_TOKEN, "");
            //将jwt token中的用户信息传给服务
            builder.header(X_CLIENT_TOKEN_USER, getUserToken(authentication));
            return chain.filter(exchange.mutate().request(builder.build()).build());
        }
        return unauthorized(exchange);
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
            token = new ObjectMapper().writeValueAsString(authService.getJwt(authentication).getBody());
            return token;
        } catch (JsonProcessingException e) {
            log.error("token json error:{}", e.getMessage());
        }
        return token;
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
