package com.fairy.cloud.gateway.admin.service.impl;

import com.fairy.cloud.gateway.admin.entity.dto.GatewayRouteDTO;
import com.fairy.cloud.gateway.admin.entity.po.GatewayRoutePO;
import com.fairy.cloud.gateway.admin.entity.query.GatewayRouteQueryParam;
import com.fairy.cloud.gateway.admin.service.GatewayRouteService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/10/28 20:04
 */
@Service
public class GatewayRouteServiceImpl implements GatewayRouteService {

    @Override
    public boolean saveRouteInfo(GatewayRouteDTO gatewayRoutForm) {
        return false;
    }

    @Override
    public boolean deleteRoute(String routId) {
        return false;
    }

    @Override
    public boolean updateRoute(GatewayRouteDTO gatewayRouteDTO) {
        return false;
    }

    @Override
    public GatewayRoutePO getRoute(String routId) {
        return null;
    }

    @Override
    public List<GatewayRoutePO> query(GatewayRouteQueryParam build) {
        return null;
    }
}
