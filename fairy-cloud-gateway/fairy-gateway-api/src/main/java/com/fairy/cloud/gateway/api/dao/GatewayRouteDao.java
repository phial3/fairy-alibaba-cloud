package com.fairy.cloud.gateway.api.dao;


import com.fairy.cloud.gateway.api.entity.po.GatewayRouteDefinition;
import com.fairy.cloud.gateway.api.entity.po.GatewayRoutePO;
import com.fairy.cloud.gateway.api.entity.query.GatewayRouteQueryParam;

import java.util.List;

public interface GatewayRouteDao {
    /**
     * 查询路由信息
     * @param id
     * @return
     */
    GatewayRoutePO findGatewayRouteByRouteId(String routeId);

    /**
     * 更新路由信息
     * @param route
     */
    void updateGatewayRoute(GatewayRoutePO route);

    /**
     * 保存路由信息
     * @param route
     */
    void saveGatewayRoute(GatewayRoutePO route);

    /**
     * 删除路由信息以及路由参数信息
     * @param routId
     */
    void deleteRoute(String routId);

    /**
     * 根据路由Id删除
     * @param routId
     */
    void deleteRouteByRouteId(String routId);

    /**
     * 查询路由信息 附加路由参数
     * @return
     */
    List<GatewayRouteDefinition> getGatewayRoute();

    /**
     * 查询
     * @param param
     * @return
     */
    List<GatewayRoutePO> query(GatewayRouteQueryParam param);
}
