package com.fairy.cloud.gateway.admin.service.impl;

import com.fairy.cloud.gateway.admin.service.GatewayRouteService;
import com.fairy.cloud.gateway.api.dao.GatewayRouteArgsDao;
import com.fairy.cloud.gateway.api.dao.GatewayRouteDao;
import com.fairy.cloud.gateway.api.entity.dto.GatewayRouteDTO;
import com.fairy.cloud.gateway.api.entity.po.GatewayRouteArgsPO;
import com.fairy.cloud.gateway.api.entity.po.GatewayRoutePO;
import com.fairy.cloud.gateway.api.entity.query.GatewayRouteQueryParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/10/28 20:04
 */
@Service
public class GatewayRouteServiceImpl implements GatewayRouteService {

    @Autowired
    private GatewayRouteDao gatewayRouteDao;
    @Autowired
    private GatewayRouteArgsDao gatewayRouteArgsDao;

    @Override
    public void saveRouteInfo(GatewayRouteDTO gatewayRouteDTO) {
        GatewayRoutePO gatewayRoutePO = GatewayRouteDTO.toGatewayRoute(gatewayRouteDTO);
        gatewayRouteDao.saveGatewayRoute(gatewayRoutePO);
        List<GatewayRouteArgsPO> filter = GatewayRouteArgsPO.toGatewayRouteFilterArgs(gatewayRouteDTO.getFilters());
        List<GatewayRouteArgsPO> predicate = GatewayRouteArgsPO.toGatewayRoutePredictArgs(gatewayRouteDTO.getPredicates());
        gatewayRouteArgsDao.saveBatch(filter);
        gatewayRouteArgsDao.saveBatch(predicate);
    }

    @Override
    public void deleteRoute(String routId) {
        gatewayRouteDao.deleteRoute(routId);
    }

    @Override
    public void updateRoute(GatewayRouteDTO gatewayRouteDTO) {
        GatewayRoutePO routePO = GatewayRouteDTO.toGatewayRoute(gatewayRouteDTO);
        List<GatewayRouteArgsPO> filter = GatewayRouteArgsPO.toGatewayRouteFilterArgs(gatewayRouteDTO.getFilters());
        List<GatewayRouteArgsPO> predicate = GatewayRouteArgsPO.toGatewayRoutePredictArgs(gatewayRouteDTO.getPredicates());

        gatewayRouteDao.updateGatewayRoute(routePO);
        gatewayRouteArgsDao.batchUpdateGatewayArgs(filter);
        gatewayRouteArgsDao.batchUpdateGatewayArgs(predicate);
    }

    @Override
    public GatewayRoutePO getRouteByRouteId(String routId) {
        return gatewayRouteDao.findGatewayRouteByRouteId(routId);
    }

    @Override
    public List<GatewayRoutePO> query(GatewayRouteQueryParam param) {
        return gatewayRouteDao.query(param);
    }
}
