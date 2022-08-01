package com.fairy.cloud.product.service;


import com.fairy.cloud.product.model.CartPromotionItem;
import com.fairy.common.response.CommonResponse;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


public interface StockManageService {

    /**
     * 添加库存
     * @param productId
     * @param skuId
     * @param quanlity
     * @param miaosha
     * @return
     */
    Integer incrStock(Long productId, Long skuId, Integer quanlity, Integer miaosha, Long flashPromotionRelationId);

    /**
     * 减库存
     * @param productId
     * @param skuId
     * @param quanlity
     * @param miaosha
     * @return
     */
    Integer descStock(@RequestParam Long productId, Long skuId, Integer quanlity, Integer miaosha, Long flashPromotionRelationId);

    /**
     * 查询库存
     * @param productId
     * @param flashPromotionRelationId
     * @return
     */
    CommonResponse<Integer> selectStock(Long productId, Long flashPromotionRelationId);

    /**
     * 方法实现说明:锁定库存
     * @param
     * @return:
     * @exception:
     */
    CommonResponse lockStock(List<CartPromotionItem> cartPromotionItemList);
}
