package com.fairy.cloud.gateway.dao.impl;

import com.fairy.cloud.gateway.dao.RouteArgsDao;
import com.fairy.cloud.gateway.entity.GatewayRouteArgsPO;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * mysql保存 路由 predict  filter参数信息
 */
@Repository
public class RouteArgsDaoImpl implements RouteArgsDao {


    @Override
    public Mono<GatewayRouteArgsPO> findByRouteIdAndTypeAndName(String routeId, String type, String name) {
        return null;
    }

    @Override
    public Flux<GatewayRouteArgsPO> findByRouteId(String routeId) {
        return null;
    }

    @Override
    public Mono<Void> deleteByRouteId(String routeId) {
        return null;
    }

    @Override
    public Mono<? extends GatewayRouteArgsPO> save(GatewayRouteArgsPO gatewayRouteArgsPO) {
        return null;
    }
}
