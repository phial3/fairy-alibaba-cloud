package com.fairy.cloud.gateway.entity;

import com.fairy.cloud.gateway.RoteTypeEnums;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
import org.springframework.cloud.gateway.route.RouteDefinition;

import java.io.Serializable;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @author 鹿少年
 * @date 2022/10/31 19:14
 */
@Builder
@AllArgsConstructor
@Data
@NoArgsConstructor
public class GatewayRouteDefinition implements Serializable {

    /**
     * 路由id
     */
    private String id;
    /**
     * 路由url
     */
    private String uri;

    /**
     * 顺序
     */
    private Integer ordered;

    /**
     * 参数
     */
    private List<GatewayRouteArgsPO> argsPOList;

    public static List<RouteDefinition> toRouteDefinition(List<GatewayRouteDefinition> routeDefinitions) {
        List<RouteDefinition> list = new ArrayList<>();
        Optional.ofNullable(routeDefinitions).get().stream()
                .forEach(rout -> {
                    RouteDefinition definition = new RouteDefinition();
                    definition.setId(rout.getId());
                    definition.setUri(URI.create(rout.getUri()));
                    definition.setOrder(rout.getOrdered());
                    List<GatewayRouteArgsPO> argsPOS = Optional.ofNullable(rout.getArgsPOList()).get();

                    List<PredicateDefinition> predicateDefinitionss = argsPOS.stream().filter(arg -> arg.getType().equals(RoteTypeEnums.PREDICT.getId()))
                            .map(GatewayRouteArgsPO::toPredictDefinition).collect(Collectors.toList());

                    List<FilterDefinition> filterDefinitions = argsPOS.stream().filter(arg -> arg.getType().equals(RoteTypeEnums.FILTER.getId()))
                            .map(GatewayRouteArgsPO::toFilterDefinition).collect(Collectors.toList());

                    definition.setPredicates(predicateDefinitionss);
                    definition.setFilters(filterDefinitions);
                    list.add(definition);
                });

        return list;

    }
}
