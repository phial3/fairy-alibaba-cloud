package com.fairy.cloud.gateway.dao;

import com.fairy.cloud.gateway.entity.GatewayRouteArgsPO;
import com.fairy.cloud.gateway.entity.GatewayRoutePO;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface RouteArgsDao {
    Mono<GatewayRouteArgsPO> findByRouteIdAndTypeAndName(String routeId, String type, String name);

    Flux<GatewayRouteArgsPO> findByRouteId(String routeId);

    Mono<Void> deleteByRouteId(String routeId);

    Mono<? extends GatewayRouteArgsPO> save(GatewayRouteArgsPO gatewayRouteArgsPO);
}
