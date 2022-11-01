//package com.fairy.cloud.gateway.routes.repository;//package com.fairy.cloud.gateway.routes;
//
//import com.fairy.cloud.gateway.service.IRouteService;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.cloud.gateway.route.RouteDefinition;
//import org.springframework.cloud.gateway.route.RouteDefinitionRepository;
//import org.springframework.cloud.gateway.support.NotFoundException;
//import org.springframework.stereotype.Repository;
//import org.springframework.util.StringUtils;
//import reactor.core.publisher.Flux;
//import reactor.core.publisher.Mono;
//
//import java.util.LinkedHashMap;
//import java.util.Map;
//
//import static java.util.Collections.synchronizedMap;
//
///**
// * @author 鹿少年
// * @date 2022/10/18 21:17
// */
//@Repository
//@Slf4j
//public class RedisRouteDefinitionRepository implements RouteDefinitionRepository {
//
//    private final Map<String, RouteDefinition> routes = synchronizedMap(new LinkedHashMap<>());
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
////        return route.flatMap(r -> {
////            if (StringUtils.isEmpty(r.getId())) {
////                return Mono.error(new IllegalArgumentException("id may not be empty"));
////            }
////            routes.put(r.getId(),r);
////            routeService.save(r);
////            return Mono.empty();
////        });
//
//
//        RouteDefinition definition = route.block();
//        if (StringUtils.isEmpty(definition.getId())) {
//            return Mono.error(new IllegalArgumentException("id may not be empty"));
//        }
//        routes.put(definition.getId(), definition);
//        routeService.save(definition);
//        return Mono.empty();
//
//    }
//
//    @Override
//    public Mono<Void> delete(Mono<String> routeId) {
////        return routeId.flatMap(id -> {
////            if (routes.containsKey(id)) {
////                routes.remove(id);
////                routeService.delete(id);
////                return Mono.empty();
////            }
////            return Mono.defer(() -> Mono.error(
////                    new NotFoundException("RouteDefinition not found: " + routeId)));
////        });
//        String id = routeId.block();
//        if (routes.containsKey(id)) {
//            routes.remove(id);
//            routeService.delete(id);
//            return Mono.empty();
//        }
//        return Mono.defer(() -> Mono.error(
//                new NotFoundException("RouteDefinition not found: " + routeId)));
//
//    }
//}
