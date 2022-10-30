package com.fairy.cloud.gateway.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fairy.cloud.gateway.admin.entity.po.GatewayRoutePO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @author 鹿少年
 * @date 2022/10/28 19:54
 */
@Mapper
@Repository
public interface GateWayRouteMapper extends BaseMapper<GatewayRoutePO> {
}
