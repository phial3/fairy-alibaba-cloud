package com.fairy.cloud.gateway.service;

import org.springframework.cloud.gateway.route.RouteDefinition;
import reactor.core.publisher.Flux;

import java.util.Collection;

public interface IRouteService {
    /**
     * 获取路由定义集合
     * @return
     */
    Collection<RouteDefinition> getRouteDefinitions();

    /**
     * 保存网关路由资源
     * @param routeDefinition
     * @return
     */
    boolean save(RouteDefinition routeDefinition);

    /**
     * 删除网关路由信息
     * @param routeId
     * @return
     */
    boolean delete(String routeId);

    Flux<RouteDefinition> findByRouteId(String id);
}
