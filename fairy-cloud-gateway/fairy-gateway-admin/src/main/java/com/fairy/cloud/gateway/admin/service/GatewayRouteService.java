package com.fairy.cloud.gateway.admin.service;

import com.fairy.cloud.gateway.admin.entity.dto.GatewayRouteDTO;
import com.fairy.cloud.gateway.admin.entity.po.GatewayRoutePO;
import com.fairy.cloud.gateway.admin.entity.query.GatewayRouteQueryParam;

import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/10/28 20:04
 */
public interface GatewayRouteService {
    /**
     * 新增网关路由信息
     *
     * @param gatewayRoutForm 网关路由信息
     * @return
     */
    boolean saveRouteInfo(GatewayRouteDTO gatewayRoutForm);

    /**
     * 删除路由信息
     *
     * @param routId
     * @return
     */
    boolean deleteRoute(String routId);

    /**
     * 更新路由信息
     *
     * @param gatewayRouteDTO
     * @return
     */
    boolean updateRoute(GatewayRouteDTO gatewayRouteDTO);

    /**
     * 查询路由
     *
     * @param routId
     * @return
     */
    GatewayRoutePO getRoute(String routId);

    /**
     * 条件查询
     *
     * @param build
     * @return
     */
    List<GatewayRoutePO> query(GatewayRouteQueryParam build);
}
