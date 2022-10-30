package com.fairy.cloud.gateway.admin.entity.po;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fairy.common.entity.po.BasePo;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotEmpty;

/**
 * 路由信息 实体存储信息
 */
@Builder
@ToString(callSuper = true)
@TableName("gateway_route")
@Data
public class GatewayRoutePO extends BasePo {
    @TableField("route_id")
    @NotEmpty(message = "网关路由Id不可为空")
    private String routeId;

    @TableField("uri")
    @NotEmpty(message = "网关路由uri不可为空")
    private String uri;

    @TableField("ordered")
    private Integer ordered;

    @TableField("description")
    @Length(min = 0,max = 10,message = "路由描述信息最大长度不可超过10")
    private String description;

}
