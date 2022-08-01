package com.fairy.cloud.product.model;

import com.fairy.cloud.mbg.model.PmsProduct;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 创建和修改商品时使用的参数
 */
@Data
public class PmsProductParam extends PmsProduct {
    /**
     * 秒杀活动价格
     */
    private BigDecimal flashPromotionPrice;
    /**
     * 活动商品库存数
     */
    private Integer flashPromotionCount;
    /**
     * 活动限购数量
     */
    private Integer flashPromotionLimit;
    /**
     * 秒杀活动状态
     * 0->关闭，1->开启
     */
    private Integer flashPromotionStatus;
    /**
     * 秒杀活动开始日期
     */
    private Date flashPromotionStartDate;
    /**
     * 秒杀活动结束日期
     */
    private Date flashPromotionEndDate;

    /**
     * 秒杀活动记录-对应记录存有库存，限购数量，秒杀价格信息
     */
    private Long flashPromotionRelationId;

}
