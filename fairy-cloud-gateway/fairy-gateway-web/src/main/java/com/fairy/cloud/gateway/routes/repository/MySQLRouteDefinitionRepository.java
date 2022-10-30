//package com.fairy.cloud.gateway.routes.repository;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.fairy.cloud.gateway.dao.RouteArgsDao;
//import com.fairy.cloud.gateway.dao.RouteDao;
//import com.fairy.cloud.gateway.entity.GatewayRouteArgsPO;
//import com.fairy.cloud.gateway.entity.GatewayRoutePO;
//import com.fairy.cloud.gateway.service.IRouteService;
//import com.fairy.cloud.gateway.util.GatewayContant;
//import org.apache.commons.lang3.ObjectUtils;
//import org.apache.commons.lang3.StringUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.cloud.gateway.filter.FilterDefinition;
//import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
//import org.springframework.cloud.gateway.route.RouteDefinition;
//import org.springframework.cloud.gateway.route.RouteDefinitionRepository;
//import org.springframework.cloud.gateway.support.NotFoundException;
//import org.springframework.data.redis.core.ReactiveStringRedisTemplate;
//import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
//import reactor.core.publisher.Flux;
//import reactor.core.publisher.Mono;
//import reactor.core.scheduler.Schedulers;
//
//import java.net.URI;
//import java.time.Instant;
//import java.util.Map;
//
//@Repository
//public class MySQLRouteDefinitionRepository implements RouteDefinitionRepository {
//
//    @Autowired
//    private IRouteService routeService;
//    @Autowired
//    private RouteDao routeDao;
//    @Autowired
//    private RouteArgsDao routeArgsDao;
//    @Autowired
//    private ReactiveStringRedisTemplate redisTemplate;
//
//    /**
//     * Gateway启动时会通过RouteDefinitionRouteLocator.getRoutes方法
//     * 将路由规则RouteDefinition转换为Route
//     * this.routeDefinitionLocator.getRouteDefinitions().map(this::convertToRoute);
//     * 加载到内存中
//     **/
//    @Override
//    public Flux<RouteDefinition> getRouteDefinitions() {
//        return Flux.fromIterable(routeService.getRouteDefinitions());
//    }
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public Mono<Void> save(Mono<RouteDefinition> route) {
//        return route.flatMap(r -> {
//            if (ObjectUtils.isEmpty(r.getId())) {
//                return Mono.error(new IllegalArgumentException("id may not be empty"));
//            } else {
//                return saveGatewayRoute(r)
//                        .thenMany(savePredicateGatewayRouteArgs(r))
//                        .thenMany(saveFilterGatewayRouteArgs(r))
//                        .then();
//            }
//        }).doOnSuccess(v -> updateVersion().subscribe());
//    }
//
//    @Override
//    @Transactional(rollbackFor = Exception.class)
//    public Mono<Void> delete(Mono<String> routeId) {
//        return routeId.flatMap(id -> routeDao.findByRouteId(id)
//                .switchIfEmpty(Mono.error(
//                        new NotFoundException("RouteDefinition not found: " + routeId)))
//                .then(routeDao.deleteByRouteId(id))
//                .then(routeArgsDao.deleteByRouteId(id))
//        ).doOnSuccess(v -> updateVersion().subscribe());
//    }
//
//    private Mono<Void> initVersion() {
//        if (GatewayContant.init.compareAndSet(Boolean.FALSE, Boolean.TRUE)) {
//            return redisTemplate.opsForValue().get(GatewayContant.REDIS_KEY_VERSION)
//                    .switchIfEmpty(Mono.just(String.valueOf(Instant.now().toEpochMilli())))
//                    .flatMap(version -> {
//                        GatewayContant.version.set(Long.valueOf(version));
//                        return Mono.empty();
//                    });
//        }
//        return Mono.empty();
//    }
//
//    private Mono<Boolean> updateVersion() {
//        Long timestamp = Instant.now().toEpochMilli();
//        return redisTemplate.opsForValue().get(GatewayContant.REDIS_KEY_VERSION)
//                .switchIfEmpty(Mono.just(StringUtils.EMPTY))
//                .flatMap(version -> {
//                    //说明其他Gateway实例再次更新了routes 将当前实例的route version重置为0
//                    if (StringUtils.isNotBlank(version) && Long.valueOf(version) > timestamp) {
//                        GatewayContant.version.set(0L);
//                        return Mono.empty();
//                    } else {
//                        return redisTemplate.opsForValue().set(GatewayContant.REDIS_KEY_VERSION, String.valueOf(timestamp));
//                    }
//                });
//    }
//
//    private Flux<RouteDefinition> findRouteDefinitions() {
//        return routeDao.findAll()
//                .publishOn(Schedulers.boundedElastic())
//                .map(gatewayRoute -> {
//                    RouteDefinition routeDefinition = new RouteDefinition();
//                    routeDefinition.setId(gatewayRoute.getRouteId());
//                    URI uri;
//                    if (StringUtils.isBlank(gatewayRoute.getUri())) {
//                        uri = null;
//                    } else {
//                        uri = URI.create(gatewayRoute.getUri());
//                    }
//                    routeDefinition.setUri(uri);
//                    routeDefinition.setOrder(gatewayRoute.getOrdered());
//                    return routeDefinition;
//                })
//                .flatMap(rd -> routeArgsDao.findByRouteId(rd.getId())
//                        .collectList()
//                        .map(list -> {
//                            for (GatewayRouteArgsPO gatewayRouteArgs : list) {
//                                if (GatewayContant.STR_PREDICATE.equalsIgnoreCase(
//                                        gatewayRouteArgs.getType())) {
//                                    PredicateDefinition pd = new PredicateDefinition();
//                                    pd.setName(gatewayRouteArgs.getName());
//                                    pd.setArgs(JSONObject.parseObject(gatewayRouteArgs.getArgs(),
//                                            Map.class));
//                                    rd.getPredicates().add(pd);
//                                } else if (GatewayContant.STR_FILTER.equalsIgnoreCase(
//                                        gatewayRouteArgs.getType())) {
//                                    FilterDefinition fd = new FilterDefinition();
//                                    fd.setName(gatewayRouteArgs.getName());
//                                    fd.setArgs(JSONObject.parseObject(gatewayRouteArgs.getArgs(),
//                                            Map.class));
//                                    rd.getFilters().add(fd);
//                                }
//                            }
//                            return rd;
//                        })
//                );
//    }
//
//    private Mono<GatewayRoutePO> saveGatewayRoute(RouteDefinition rd) {
//        return routeDao.findByRouteId(rd.getId())
//                .switchIfEmpty(Mono.just(GatewayRoutePO.builder().routeId(rd.getId()).build()))
//                .flatMap(gatewayRoute -> {
//                    String uriStr = StringUtils.EMPTY;
//                    if (rd.getUri() != null) {
//                        uriStr = rd.getUri().toString();
//                    }
//                    gatewayRoute.setUri(uriStr);
//                    gatewayRoute.setOrdered(rd.getOrder());
//                    return routeDao.save(gatewayRoute);
//                });
//    }
//
//    private Flux<GatewayRouteArgsPO> savePredicateGatewayRouteArgs(RouteDefinition rd) {
//        return Flux.fromIterable(rd.getPredicates())
//                .flatMap(pd -> routeArgsDao.findByRouteIdAndTypeAndName(
//                                rd.getId(), GatewayContant.STR_PREDICATE, pd.getName())
//                        .switchIfEmpty(Mono.just(GatewayRouteArgsPO.builder().routeId(rd.getId())
//                                .type(GatewayContant.STR_PREDICATE)
//                                .name(pd.getName())
//                                .build()))
//                        .flatMap(gatewayRouteArgs -> {
//                            JSONObject args = JSONObject.parseObject(
//                                    gatewayRouteArgs.getArgs());
//                            if (args == null) {
//                                args = new JSONObject();
//                            }
//                            args.putAll(pd.getArgs());
//                            gatewayRouteArgs.setArgs(args.toJSONString());
//                            return routeArgsDao.save(gatewayRouteArgs);
//                        }));
//    }
//
//    private Flux<GatewayRouteArgsPO> saveFilterGatewayRouteArgs(RouteDefinition rd) {
//        return Flux.fromIterable(rd.getFilters())
//                .flatMap(fd -> routeArgsDao.findByRouteIdAndTypeAndName(
//                                rd.getId(), GatewayContant.STR_FILTER, fd.getName())
//                        .switchIfEmpty(Mono.just(GatewayRouteArgsPO.builder().routeId(rd.getId())
//                                .type(GatewayContant.STR_FILTER)
//                                .name(fd.getName())
//                                .build()))
//                        .flatMap(gatewayRouteArgs -> {
//                            JSONObject args = new JSONObject();
//                            if (JSON.isValid(gatewayRouteArgs.getArgs())) {
//                                args = JSONObject.parseObject(gatewayRouteArgs.getArgs());
//                            }
//                            args.putAll(fd.getArgs());
//                            gatewayRouteArgs.setArgs(args.toJSONString());
//                            return routeArgsDao.save(gatewayRouteArgs);
//                        }));
//    }
//
//}
