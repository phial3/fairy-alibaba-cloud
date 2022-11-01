package com.fairy.cloud.gateway.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fairy.cloud.gateway.dao.GatewayRouteArgsDao;
import com.fairy.cloud.gateway.entity.GatewayRouteArgsPO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * @author 鹿少年
 * @date 2022/11/1 22:13
 */
@Component
@Mapper
public interface GatewayRouteArgsMapper extends BaseMapper<GatewayRouteArgsPO> {
}
