package com.fairy.cloud.gateway.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fairy.cloud.gateway.RoteTypeEnums;
import com.fairy.common.entity.po.BasePo;
import com.fairy.common.error.ServiceException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Builder
@ToString(callSuper = true)
@TableName("gateway_route_args")
@Data
@Slf4j
public class GatewayRouteArgsPO extends BasePo {

    private static final ObjectMapper mapper = new ObjectMapper();

    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField("route_id")
    private String routeId;

    @TableField("type")
    private Integer type;

    @TableField("name")
    private String name;

    /**
     * args参数是序列化得到的
     */
    @TableField("args")
    private String args;

    public static PredicateDefinition toPredictDefinition(GatewayRouteArgsPO argsPO) {
        PredicateDefinition definition = new PredicateDefinition();
        try {
            definition.setName(argsPO.getName());
            definition.setArgs(mapper.readValue(argsPO.getArgs(), HashMap.class));
        } catch (JsonProcessingException e) {
            log.error("路由信息转换异常 :[{}]",e.getMessage());
            throw new ServiceException( e.getMessage());
        }
        return definition;
    }

    public static FilterDefinition toFilterDefinition(GatewayRouteArgsPO argsPO) {
        FilterDefinition definition = new FilterDefinition();
        try {
            definition.setName(argsPO.getName());
            definition.setArgs(mapper.readValue(argsPO.getArgs(), HashMap.class));
        } catch (JsonProcessingException e) {
            log.error("路由信息转换异常 :[{}]",e.getMessage());
            throw new ServiceException( e.getMessage());
        }
        return definition;
    }

    public static List<GatewayRouteArgsPO> toGatewayRouteFilterArgs(List<FilterDefinition> filters) {
        List<GatewayRouteArgsPO> list = new ArrayList<>();
        filters.stream().forEach(filterDefinition -> {
            try {
                list.add(GatewayRouteArgsPO.builder().name(filterDefinition.getName()).type(RoteTypeEnums.FILTER.getId()).args(mapper.writeValueAsString(filterDefinition.getArgs())).build());
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        });
        return list;
    }

    public static List<GatewayRouteArgsPO> toGatewayRoutePredictArgs(List<PredicateDefinition> predicates) {
        List<GatewayRouteArgsPO> list = new ArrayList<>();
        predicates.stream().forEach(predicateDefinition -> {
            try {
                list.add(GatewayRouteArgsPO.builder().name(predicateDefinition.getName()).type(RoteTypeEnums.PREDICT.getId()).args(mapper.writeValueAsString(predicateDefinition.getArgs())).build());
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        });
        return list;
    }
}
