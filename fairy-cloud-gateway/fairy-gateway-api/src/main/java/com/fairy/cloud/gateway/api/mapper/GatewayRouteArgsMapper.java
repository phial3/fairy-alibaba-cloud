package com.fairy.cloud.gateway.api.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fairy.cloud.gateway.api.entity.po.GatewayRouteArgsPO;
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
