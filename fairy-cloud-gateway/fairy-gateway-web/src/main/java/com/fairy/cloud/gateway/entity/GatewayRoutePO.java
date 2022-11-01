package com.fairy.cloud.gateway.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fairy.common.entity.po.BasePo;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import org.springframework.cloud.gateway.route.RouteDefinition;

import javax.validation.constraints.Max;
import java.util.Objects;

/**
 * 路由信息 实体存储信息
 */
@Builder
@ToString(callSuper = true)
@TableName("gateway_route")
@Data
public class GatewayRoutePO extends BasePo {

    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField("route_id")
    private String routeId;

    @Max(value = 30, message = "最大长度不可超过30")
    @TableField("uri")
    private String uri;

    @TableField("ordered")
    private Integer ordered=0;

    public static GatewayRoutePO toGatewayRoute(RouteDefinition definition) {
        return GatewayRoutePO.builder().routeId(definition.getId()).ordered(
                Objects.isNull(definition.getOrder())?0:definition.getOrder()
        ).uri(definition.getUri().toString()).build();
    }
}
