package com.fairy.cloud.gateway.dao.impl;

import com.fairy.cloud.gateway.dao.RouteDao;
import com.fairy.cloud.gateway.entity.GatewayRoutePO;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * 路由信息存储
 */
@Repository
public class RouteDaoImpl implements RouteDao {
    @Override
    public Mono<GatewayRoutePO> findByRouteId(String routeId) {
        return null;
    }

    @Override
    public Mono<Void> deleteByRouteId(String routeId) {
        return null;
    }

    @Override
    public Flux<GatewayRoutePO> findAll() {
        return null;
    }

    @Override
    public Mono<? extends GatewayRoutePO> save(GatewayRoutePO gatewayRoute) {
        return null;
    }
}
