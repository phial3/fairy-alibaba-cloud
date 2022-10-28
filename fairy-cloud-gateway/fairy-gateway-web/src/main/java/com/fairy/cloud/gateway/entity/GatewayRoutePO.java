package com.fairy.cloud.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fairy.common.entity.po.BasePo;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * 路由信息 实体存储信息
 */
@Builder
@ToString(callSuper = true)
@TableName("gateway_route")
@Data
public class GatewayRoutePO extends BasePo {
    @TableField("route_id")
    private String routeId;

    @TableField("uri")
    private String uri;

    @TableField("ordered")
    private Integer ordered;

}
