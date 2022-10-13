package com.fairy.cloud.product.controller;

import com.fairy.cloud.product.service.StockManageService;
import com.fairy.common.response.Result;
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
     *
     * @param productId 产品ID
     * @param quanlity  数量
     * @return
     */
    @RequestMapping(value = "/descStock", method = {RequestMethod.GET, RequestMethod.POST})
    public Result descStock(@RequestParam Long productId, Integer quanlity) {
        return null;
    }

    /**
     * 加库存
     *
     * @param productId 产品ID
     * @param quanlity  数量
     * @return
     */
    @RequestMapping(value = "/incrStock", method = {RequestMethod.GET, RequestMethod.POST})
    public Result incrStock(@RequestParam Long productId, Integer quanlity) {
        return null;
    }

    /**
     * 查询当前产品的库存
     *
     * @param productId
     * @return
     */
    @RequestMapping(value = "/selectStock", method = {RequestMethod.GET, RequestMethod.POST})
    public Result<Integer> selectStock(@RequestParam("productId") Long productId, @RequestParam("flashPromotionRelationId") Long flashPromotionRelationId) {
        return stockManageService.selectStock(productId, flashPromotionRelationId);
    }

}
