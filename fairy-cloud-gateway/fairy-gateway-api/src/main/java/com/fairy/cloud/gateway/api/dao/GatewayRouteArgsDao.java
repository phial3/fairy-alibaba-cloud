package com.fairy.cloud.gateway.api.dao;


import com.baomidou.mybatisplus.extension.service.IService;
import com.fairy.cloud.gateway.api.entity.po.GatewayRouteArgsPO;

import java.util.List;

public interface GatewayRouteArgsDao extends IService<GatewayRouteArgsPO> {

    /**
     * 批量更新路由参数信息
     * @param filter
     */
    void batchUpdateGatewayArgs(List<GatewayRouteArgsPO> filter);

    /**
     * 批量保存路由参数信息
     * @param predicate
     */
    void bathSaveGatewayArgs(List<GatewayRouteArgsPO> predicate);

    /**
     * 删除路由参数信息
     * @param routId
     */
    void deleteRouteArgsByRouteId(String routId);
}
