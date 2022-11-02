package com.fairy.cloud.gateway.api.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fairy.common.entity.po.BasePo;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.springframework.cloud.gateway.route.RouteDefinition;

import javax.validation.constraints.NotEmpty;
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
    @NotEmpty(message = "网关路由Id不可为空")
    private String routeId;

    @TableField("uri")
    @NotEmpty(message = "网关路由uri不可为空")
    @Length(min = 0, max = 10, message = "路由uri最大长度不可超过10")
    private String uri;

    @TableField("ordered")
    private Integer ordered = 0;

    public static GatewayRoutePO toGatewayRoute(RouteDefinition definition) {
        return GatewayRoutePO.builder().routeId(definition.getId()).ordered(
                Objects.isNull(definition.getOrder()) ? 0 : definition.getOrder()
        ).uri(definition.getUri().toString()).build();
    }
}
