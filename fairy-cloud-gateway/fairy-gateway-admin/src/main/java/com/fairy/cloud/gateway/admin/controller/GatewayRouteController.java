package com.fairy.cloud.gateway.admin.controller;

import com.fairy.cloud.gateway.admin.service.GatewayRouteService;
import com.fairy.cloud.gateway.api.entity.dto.GatewayRouteDTO;
import com.fairy.cloud.gateway.api.entity.po.GatewayRoutePO;
import com.fairy.cloud.gateway.api.entity.query.GatewayRouteQueryParam;
import com.fairy.common.response.Result;
import io.swagger.annotations.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

/**
 * @author 鹿少年
 * @date 2022/10/28 20:02
 */
@RestController
@RequestMapping("/gateway/routes")
@Api("gateway routes")
public class GatewayRouteController {

    private static final Logger LOGGER = LoggerFactory.getLogger(GatewayRouteController.class);


    @Autowired
    private GatewayRouteService gatewayRoutService;

    @ApiOperation(value = "新增网关路由", notes = "新增一个网关路由")
    @ApiImplicitParam(name = "gatewayRouteDTO", value = "新增网关路由form表单", required = true, dataType = "GatewayRouteDTO")
    @PostMapping("/add")
    public Result add(@Validated @RequestBody GatewayRouteDTO gatewayRouteDTO) {
        LOGGER.info("新增网关路由: {}", gatewayRouteDTO);
        gatewayRoutService.saveRouteInfo(gatewayRouteDTO);
        return Result.success("新增网关路由成功");
    }

    @ApiOperation(value = "删除网关路由", notes = "根据url的id来指定删除对象")
    @ApiImplicitParam(paramType = "path", name = "id", value = "网关路由ID", required = true, dataType = "string")
    @DeleteMapping(value = "/delete/{id}")
    public Result delete(@PathVariable(name = "id") String routId) {
        LOGGER.info("删除网关路由id: {}", routId);
        gatewayRoutService.deleteRoute(routId);
        return Result.success("删除网关路由id成功");
    }

    @ApiOperation(value = "更新网关路由", notes = "修改指定网关路由信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "gatewayRouteDTO", value = "网关路由实体", required = true, dataType = "GatewayRouteDTO")
    })
    @PutMapping(value = "/update")
    public Result update(@Validated @RequestBody GatewayRouteDTO gatewayRouteDTO) {
        LOGGER.info("更新网关路由: {}", gatewayRouteDTO);
        gatewayRoutService.updateRoute(gatewayRouteDTO);
        return Result.success("更新网关路由成功");
    }

    @ApiOperation(value = "获取网关路由", notes = "根据id获取指定网关路由信息")
    @ApiImplicitParam(paramType = "path", name = "id", value = "网关路由ID", required = true, dataType = "string")
    @GetMapping(value = "/get/{id}")
    public Result get(@PathVariable(name = "id") String routId) {
        LOGGER.info("get with id:{}", routId);
        return Result.success(gatewayRoutService.getRouteByRouteId(routId));
    }

    @ApiOperation(value = "根据uri获取网关路由", notes = "根据uri获取网关路由信息，简单查询")
    @ApiImplicitParam(paramType = "query", name = "name", value = "网关路由路径", required = true, dataType = "string")
    @ApiResponses(
            @ApiResponse(code = 200, message = "处理成功", response = Result.class)
    )
    @GetMapping
    public Result getByUri(@RequestParam String uri) {
        List<GatewayRoutePO> list = gatewayRoutService.query(GatewayRouteQueryParam.builder().uri(uri).build());
        return Result.success(Optional.ofNullable(list).get().stream().findFirst());
    }

    @ApiOperation(value = "搜索网关路由", notes = "根据条件查询网关路由信息")
    @ApiImplicitParam(name = "gatewayRouteQueryParam", value = "网关路由查询参数", required = true, dataType = "GatewayRouteQueryParam")
    @ApiResponses(
            @ApiResponse(code = 200, message = "处理成功", response = Result.class)
    )
    @PostMapping(value = "/conditions")
    public Result search(@Validated @RequestBody GatewayRouteQueryParam gatewayRouteQueryParam) {
        return Result.success(gatewayRoutService.query(gatewayRouteQueryParam));
    }

}
