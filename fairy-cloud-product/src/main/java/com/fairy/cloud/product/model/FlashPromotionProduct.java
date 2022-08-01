package com.fairy.cloud.product.model;

import com.fairy.cloud.mbg.model.PmsProduct;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 秒杀信息和商品对象封装
 */
@Data
public class FlashPromotionProduct extends PmsProduct {
    private BigDecimal flashPromotionPrice;
    private Integer flashPromotionCount;
    private Integer flashPromotionLimit;
}
