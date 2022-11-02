package com.fairy.cloud.gateway.api.entity.dto;

import com.fairy.cloud.gateway.api.entity.po.GatewayRoutePO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/10/28 20:05
 */
@ApiModel
@Builder
@AllArgsConstructor
@ToString(callSuper = true)
@Data
public class GatewayRouteDTO implements Serializable {

    @NotEmpty(message = "网关断言不能为空")
    @ApiModelProperty(value = "网关断言")
    private List<PredicateDefinition> predicates = new ArrayList<>();

    @ApiModelProperty(value = "网关过滤器信息")
    private List<FilterDefinition> filters = new ArrayList<>();

    @NotBlank(message = "uri不能为空")
    @ApiModelProperty(value = "网关uri")
    private String uri;

    @NotBlank(message = "路由id不能为空")
    @ApiModelProperty(value = "网关路由id")
    private String routeId;

    @ApiModelProperty(value = "排序")
    private Integer ordered = 0;

    @ApiModelProperty(value = "网关路由描述信息")
    private String description;

    /**
     * gateway 路由信息
     * @return
     */
    public static GatewayRoutePO toGatewayRoute(GatewayRouteDTO routeDTO) {
        return GatewayRoutePO.builder()
                .routeId(routeDTO.getRouteId())
                .uri(routeDTO.getUri())
                .ordered(routeDTO.getOrdered())
                .build();
    }
}
