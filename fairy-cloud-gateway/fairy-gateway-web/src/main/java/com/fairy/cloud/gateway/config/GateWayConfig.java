package com.fairy.cloud.gateway.config;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 动态路由 网关配置
 * @author 鹿少年
 * @date 2022/10/23 16:55
 */
@Configuration
public class GateWayConfig {
    /**
     * 配置一个id为route-name的路由规则，
     * 当访问地址http://localhost:8085/admin/**时会自动转发到地址：http://localhost:8084/
     * @param routeLocatorBuilder
     * @return
     */
    @Bean
    public RouteLocator customRouteLocator(RouteLocatorBuilder routeLocatorBuilder){
        RouteLocatorBuilder.Builder routes = routeLocatorBuilder.routes();

//        routes.route("authorication-admin",
//                r -> r.path("/admin/**")
//                        .uri("lb://authorication-admin"))
////                        .uri("http://localhost:8084"))
//                .build();
        return routes.build();
    }
}
