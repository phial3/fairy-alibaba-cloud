package com.fairy.cloud.gateway.api.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.fairy.cloud.gateway.api.dao.GatewayRouteDao;
import com.fairy.cloud.gateway.api.entity.po.GatewayRouteDefinition;
import com.fairy.cloud.gateway.api.entity.po.GatewayRoutePO;
import com.fairy.cloud.gateway.api.entity.query.GatewayRouteQueryParam;
import com.fairy.cloud.gateway.api.mapper.GatewayRouteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 路由信息存储
 */
@Repository
public class GatewayRouteDaoImpl implements GatewayRouteDao {

    @Autowired
    private GatewayRouteMapper gatewayRouteMapper;

    @Override
    public GatewayRoutePO findGatewayRouteByRouteId(String routeId) {
        return gatewayRouteMapper.selectOne(new LambdaQueryWrapper<GatewayRoutePO>().eq(GatewayRoutePO::getRouteId,routeId));
    }

    @Override
    public void updateGatewayRoute(GatewayRoutePO route) {
        gatewayRouteMapper.update(route,new LambdaQueryWrapper<GatewayRoutePO>().eq(GatewayRoutePO::getRouteId,route.getRouteId()));
    }

    @Override
    public void saveGatewayRoute(GatewayRoutePO route) {
        gatewayRouteMapper.insert(route);
    }

    @Override
    public void deleteRoute(String routId) {
        gatewayRouteMapper.deleteRoute(routId);
    }

    @Override
    public void deleteRouteByRouteId(String routId) {
        gatewayRouteMapper.delete(new LambdaQueryWrapper<GatewayRoutePO>().eq(GatewayRoutePO::getRouteId,routId));
    }

    @Override
    public List<GatewayRouteDefinition> getGatewayRoute() {
        return gatewayRouteMapper.getGatewayRoute();
    }

    @Override
    public List<GatewayRoutePO> query(GatewayRouteQueryParam param) {
        LambdaQueryWrapper<GatewayRoutePO> wrapper = new LambdaQueryWrapper<>();
        if(param.getCreatedTimeStart()!=null){
            wrapper.ge(GatewayRoutePO::getCreatedTime,param.getCreatedTimeStart());
        }
        if(param.getCreatedTimeEnd()!=null){
            wrapper.ge(GatewayRoutePO::getCreatedTime,param.getCreatedTimeEnd());
        }
        if(param.getUri()!=null && param.getUri()!=""){
            wrapper.ge(GatewayRoutePO::getUri,param.getUri());
        }
        return gatewayRouteMapper.selectList(wrapper);
    }
}
