package com.fairy.cloud.gateway.dao;

import com.fairy.cloud.gateway.entity.GatewayRoutePO;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface RouteDao {
    Mono<GatewayRoutePO> findByRouteId(String routeId);

    Mono<Void> deleteByRouteId(String routeId);

    Flux<GatewayRoutePO> findAll();

    Mono<? extends GatewayRoutePO> save(GatewayRoutePO gatewayRoute);
}
