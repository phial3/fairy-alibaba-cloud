package com.fairy.cloud.product.controller;

import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.cloud.product.service.PmsProductService;
import com.fairy.common.response.CommonResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@Api(tags = "PortalProductController", description = "商品查询查看")
public class PortalProductController {

    @Autowired
    private PmsProductService pmsProductService;

    /**
     * 只有通过过滤拦截请求后的 才可以访问接口
     *
     * @param id
     * @return
     */
    @ApiOperation(value = "根据商品id获取商品详情#功能需要做QPS优化")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "flashPromotionId", value = "秒杀活动ID", paramType = "query", dataType = "long"),
            @ApiImplicitParam(name = "flashPromotionSessionId", value = "活动场次ID,例如:12点场", paramType = "query", dataType = "long")
    })
    @RequestMapping(value = "/productInfo/{id}", method = RequestMethod.GET)
    public CommonResponse getProductInfo(@PathVariable Long id) {
        PmsProductPO pmsProduct = pmsProductService.getProductInfo(id);
        return CommonResponse.success(pmsProduct);
    }




}
