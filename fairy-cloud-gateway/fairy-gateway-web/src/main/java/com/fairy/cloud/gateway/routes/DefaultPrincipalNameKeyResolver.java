package com.fairy.cloud.gateway.routes;//package com.fairy.cloud.gateway.routes;
//
//import org.springframework.cloud.gateway.filter.ratelimit.PrincipalNameKeyResolver;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.server.ServerWebExchange;
//import reactor.core.publisher.Mono;
//
///**
// * @author 鹿少年
// * @date 2022/10/23 13:11
// */
//@Configuration
//public class DefaultPrincipalNameKeyResolver  extends PrincipalNameKeyResolver {
//
//    @Override
//    public Mono<String> resolve(ServerWebExchange exchange) {
//        return exchange.getPrincipal().flatMap(p -> Mono.justOrEmpty(p.getName()));
//    }
//}
