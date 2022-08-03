package com.fairy.cloud.product.controller;

import com.fairy.cloud.mbg.mapper.PmsBrandMapper;
import com.fairy.cloud.mbg.model.pojo.OmsOrderItemPO;
import com.fairy.cloud.mbg.model.pojo.PmsBrandPO;
import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.cloud.product.constant.Constants;
import com.fairy.cloud.product.feign.OrderFeign;
import com.fairy.cloud.product.feign.StockFeign;
import com.fairy.cloud.product.service.PmsProductService;
import com.fairy.common.response.CommonResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;


@RestController
@Api(tags = "PortalProductController", description = "商品查询查看")
public class PortalProductController {

    @Autowired
    private PmsProductService pmsProductService;

    @Autowired
    private OrderFeign orderFeign;
    @Autowired
    private StockFeign stockFeign;

    @Autowired
    private PmsBrandMapper pmsBrandMapper;

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
    public CommonResponse getProductInfo(@PathVariable Integer id) {
        PmsProductPO pmsProduct = pmsProductService.getProductInfo(id);
        return CommonResponse.success(pmsProduct);
    }

    /**
     * 下单操作
     *
     * @param productId
     * @return
     */
    @RequestMapping(value = "/sale/{productId}", method = RequestMethod.GET)
    public CommonResponse saleProduct(HttpServletRequest request, Principal principal, @PathVariable Integer productId) {
        String userName = request.getHeader("username");
        Integer memberId = Integer.parseInt(request.getHeader("memberId"));
        //新增一条订单
        OmsOrderItemPO omsOrderItemPO = new OmsOrderItemPO();
        PmsProductPO productPO = pmsProductService.getProductInfo(productId);
        omsOrderItemPO.setProductPrice(productPO.getPrice());
        omsOrderItemPO.setProductPic(productPO.getPic());
        //品牌
        PmsBrandPO pmsBrandPO = pmsBrandMapper.selectById(productPO.getBrandId());
        omsOrderItemPO.setProductBrand(pmsBrandPO.getName());
        omsOrderItemPO.setProductQuantity(2);
        omsOrderItemPO.setOrderSn(Constants.getOrderSn(productId, memberId));
        omsOrderItemPO.setProductName(productPO.getName());
        omsOrderItemPO.setProductSn(productPO.getProductSn());
        orderFeign.createOrder(omsOrderItemPO);
        //库存减少
        stockFeign.deduceStock(productId);
        return CommonResponse.success("下单成功");
    }


}
