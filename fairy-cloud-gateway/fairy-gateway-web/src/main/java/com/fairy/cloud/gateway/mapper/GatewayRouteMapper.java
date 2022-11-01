package com.fairy.cloud.gateway.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fairy.cloud.gateway.entity.GatewayRouteDefinition;
import com.fairy.cloud.gateway.entity.GatewayRoutePO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/11/1 22:12
 */
@Mapper
@Component
public interface GatewayRouteMapper extends BaseMapper<GatewayRoutePO> {

    /**
     * 查询所有的路由信息 路由参数信息
     * @return
     */
    List<GatewayRouteDefinition> getGatewayRoute();

    /**
     * 删除路由信息 路由参数信息
     * @param routId
     */
    void deleteRoute(@Param("routeId") String routId);
}
