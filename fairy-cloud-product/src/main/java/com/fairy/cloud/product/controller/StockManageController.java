package com.fairy.cloud.product.controller;

import com.fairy.cloud.product.service.StockManageService;
import com.fairy.common.response.CommonResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/stock")
public class StockManageController {

    @Autowired
    private StockManageService stockManageService;

    /**
     * 减库存
     * @param productId
     *        产品ID
     * @param skuId
     *        sku-ID
     * @param quanlity
     *        数量
     * @param miaosha
     *      1->减秒杀库存,0->减sku库存
     * @return
     */
    @RequestMapping(value = "/descStock",method = {RequestMethod.GET,RequestMethod.POST})
    public CommonResponse descStock(@RequestParam Long productId, Long skuId, Integer quanlity, Integer miaosha){
        return null;
    }

    /**
     * 加库存
     * @param productId
     *        产品ID
     * @param skuId
     *        sku-ID
     * @param quanlity
     *        数量
     * @param miaosha
     *        1->加回秒杀库存,0->加回sku库存
     * @return
     */
    @RequestMapping(value = "/incrStock",method = {RequestMethod.GET,RequestMethod.POST})
    public CommonResponse incrStock(@RequestParam Long productId, Long skuId, Integer quanlity, Integer miaosha){
        return null;
    }

    /**
     * 查询当前产品的库存
     * @param productId
     * @return
     */
    @RequestMapping(value = "/selectStock",method = {RequestMethod.GET,RequestMethod.POST})
    public CommonResponse<Integer> selectStock(@RequestParam("productId") Long productId,@RequestParam("flashPromotionRelationId") Long flashPromotionRelationId){
        return stockManageService.selectStock(productId,flashPromotionRelationId);
    }


}
