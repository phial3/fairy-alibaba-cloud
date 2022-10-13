package com.fairy.cloud.product.service.impl;

import com.fairy.cloud.product.service.StockManageService;
import com.fairy.common.response.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;



@Service
@Slf4j
public class StockManageServiceImpl implements StockManageService {


    @Override
    public Integer incrStock(Long productId, Long skuId, Integer quanlity, Integer miaosha, Long flashPromotionRelationId) {
        return null;
    }

    @Override
    public Integer descStock(Long productId, Long skuId, Integer quanlity, Integer miaosha, Long flashPromotionRelationId) {
        return null;
    }

    /**
     * 获取产品库存
     * @param productId
     * @param flashPromotionRelationId
     * @return
     */
    @Override
    public Result<Integer> selectStock(Long productId, Long flashPromotionRelationId) {


        return Result.success();
    }



}
