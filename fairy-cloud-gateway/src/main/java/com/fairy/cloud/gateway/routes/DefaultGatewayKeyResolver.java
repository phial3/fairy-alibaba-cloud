package com.fairy.cloud.gateway.routes;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
import org.springframework.cloud.gateway.route.Route;
import org.springframework.cloud.gateway.support.ServerWebExchangeUtils;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Optional;

/**
 * 限流的key获取
 * @author 鹿少年
 * @date 2022/10/23 13:11
 */
@Slf4j
@Component
public class DefaultGatewayKeyResolver implements KeyResolver {

    @Override
    public Mono<String> resolve(ServerWebExchange exchange) {
        // 获取当前路由
        Route route = exchange.getAttribute(ServerWebExchangeUtils.GATEWAY_ROUTE_ATTR);

        ServerHttpRequest request = exchange.getRequest();
        String uri = request.getURI().getPath();
        log.info("当前返回的uri:[{}]", uri);

        return Mono.just(Optional.ofNullable(route).map(Route::getId).orElse("") + "/" + uri);
    }
}
