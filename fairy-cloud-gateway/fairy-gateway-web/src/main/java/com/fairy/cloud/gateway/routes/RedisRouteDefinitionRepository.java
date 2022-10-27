package com.fairy.cloud.gateway.routes;//package com.fairy.cloud.gateway.routes;
//
//import com.fairy.cloud.gateway.service.IRouteService;
//import com.fairy.cloud.gateway.service.impl.RouteService;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.cloud.gateway.route.RouteDefinition;
//import org.springframework.cloud.gateway.route.RouteDefinitionRepository;
//import org.springframework.stereotype.Component;
//import org.springframework.stereotype.Repository;
//import org.springframework.util.StringUtils;
//import reactor.core.publisher.Flux;
//import reactor.core.publisher.Mono;
//
///**
// * @author 鹿少年
// * @date 2022/10/18 21:17
// */
//@Repository
//@Slf4j
//public class RedisRouteDefinitionRepository implements RouteDefinitionRepository {
//
//    @Autowired
//    private IRouteService routeService;
//
//    @Override
//    public Flux<RouteDefinition> getRouteDefinitions() {
//        return Flux.fromIterable(routeService.getRouteDefinitions());
//    }
//
//    @Override
//    public Mono<Void> save(Mono<RouteDefinition> route) {
//        return route.flatMap(r -> {
//            if (StringUtils.isEmpty(r.getId())) {
//                return Mono.error(new IllegalArgumentException("id may not be empty"));
//            }
//            routeService.save(r);
//            return Mono.empty();
//        });
//
//    }
//
//    @Override
//    public Mono<Void> delete(Mono<String> routeId) {
//        return routeId.flatMap(id -> {
//            routeService.delete(id);
//            return Mono.empty();
//        });
//    }
//}
