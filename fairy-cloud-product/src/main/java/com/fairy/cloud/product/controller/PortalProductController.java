package com.fairy.cloud.product.controller;

import com.fairy.cloud.product.dao.PortalProductDao;
import com.fairy.cloud.product.model.*;
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
@RequestMapping("/pms")
public class PortalProductController {

    @Autowired
    private PmsProductService pmsProductService;

    @Autowired
    private PortalProductDao portalProductDao;

    @ApiOperation(value = "根据商品id获取商品详情#功能需要做QPS优化")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "flashPromotionId",value = "秒杀活动ID",paramType = "query",dataType = "long"),
            @ApiImplicitParam(name = "flashPromotionSessionId",value = "活动场次ID,例如:12点场",paramType = "query",dataType = "long")
    })
    @RequestMapping(value = "/productInfo/{id}", method = RequestMethod.GET)
    public CommonResponse getProductInfo(@PathVariable Long id) {
        PmsProductParam pmsProductParam=pmsProductService.getProductInfo(id);
        return CommonResponse.success(pmsProductParam);
    }




    @ApiOperation(value = "根据商品Id获取购物车商品的信息")
    @RequestMapping(value = "/cartProduct/{productId}", method = RequestMethod.GET)
    public CommonResponse<CartProduct> getCartProduct(@PathVariable("productId") Long productId){
        CartProduct cartProduct = portalProductDao.getCartProduct(productId);
        return CommonResponse.success(cartProduct);
    }

    @ApiOperation(value = "根据商品Ids获取促销商品信息")
    @RequestMapping(value = "/getPromotionProductList", method = RequestMethod.GET)
    public CommonResponse<List<PromotionProduct>> getPromotionProductList(@RequestParam("productIds") List<Long> ids){
        List<PromotionProduct> promotionProducts = portalProductDao.getPromotionProductList(ids);
        return CommonResponse.success(promotionProducts);
    }

    @ApiOperation("当前秒杀活动场-产品列表#需要做QPS优化")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "flashPromotionId", value = "秒杀活动ID", required = true, paramType = "query", dataType = "integer"),
            @ApiImplicitParam(name = "flashPromotionSessionId", value = "秒杀活动时间段ID", required = true, paramType = "query", dataType = "integer")})
    @GetMapping("/flashPromotion/productList")
    public CommonResponse<List<FlashPromotionProduct>> getProduct(
            @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            //当前秒杀活动主题ID
            @RequestParam(value = "flashPromotionId") Long flashPromotionId,
            //当前秒杀活动场次ID
            @RequestParam(value = "flashPromotionSessionId") Long flashPromotionSessionId){
        return CommonResponse.success(pmsProductService.getFlashProductList(pageSize,pageNum,flashPromotionId,flashPromotionSessionId));
    }


    @ApiOperation(value = "获取当前日期所有活动场次#需要做QPS优化",notes = "示例：10:00场,13:00场")
    @GetMapping("/flashPromotion/getSessionTimeList")
    public CommonResponse<List<FlashPromotionSessionExt>> getSessionTimeList() {
        return CommonResponse.success(pmsProductService.getFlashPromotionSessionList());
    }

    @ApiOperation("获取首页秒杀商品")
    @GetMapping("/flashPromotion/getHomeSecKillProductList")
    public CommonResponse<List<FlashPromotionProduct>> getHomeSecKillProductList(){
        return CommonResponse.success(pmsProductService.getHomeSecKillProductList());
    }

}
