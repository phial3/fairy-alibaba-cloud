package com.fairy.cloud.gateway.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fairy.common.entity.po.BasePo;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Builder
@ToString(callSuper = true)
@TableName("gateway_route-args")
@Data
public class GatewayRouteArgsPO extends BasePo {

    @TableField("route_id")
    private String routeId;

    @TableField("type")
    private String type;

    @TableField("name")
    private String name;

    @TableField("args")
    private String args;

}
