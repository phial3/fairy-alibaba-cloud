package com.fairy.cloud.gateway.dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fairy.cloud.gateway.dao.GatewayRouteArgsDao;
import com.fairy.cloud.gateway.entity.GatewayRouteArgsPO;
import com.fairy.cloud.gateway.mapper.GatewayRouteArgsMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * mysql保存 路由 predict  filter参数信息
 */
@Repository
@Slf4j
public class GatewayRouteArgsDaoImpl extends ServiceImpl<GatewayRouteArgsMapper, GatewayRouteArgsPO> implements GatewayRouteArgsDao {


    @Resource
    private GatewayRouteArgsMapper gatewayRouteArgsMapper;

    @Override
    public void batchUpdateGatewayArgs(List<GatewayRouteArgsPO> filter) {
        this.updateBatchById(filter);
    }

    @Override
    public void bathSaveGatewayArgs(List<GatewayRouteArgsPO> predicate) {
        this.saveBatch(predicate);
    }

    @Override
    public void deleteRouteArgsByRouteId(String routId) {

        gatewayRouteArgsMapper.delete(new LambdaQueryWrapper<GatewayRouteArgsPO>().eq(GatewayRouteArgsPO::getRouteId, routId));
    }
}
