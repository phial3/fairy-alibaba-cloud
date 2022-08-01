package com.fairy.cloud.product.model;


import com.fairy.cloud.mbg.model.PmsProduct;
import com.fairy.cloud.mbg.model.PmsProductFullReduction;
import com.fairy.cloud.mbg.model.PmsProductLadder;
import com.fairy.cloud.mbg.model.PmsSkuStock;
import lombok.Data;

import java.util.List;

/**
 * 商品的促销信息，包括sku、打折优惠、满减优惠
 */
@Data
public class PromotionProduct extends PmsProduct {
    /**商品库存信息*/
    private List<PmsSkuStock> skuStockList;
    /**商品打折信息*/
    private List<PmsProductLadder> productLadderList;
    /**商品满减信息*/
    private List<PmsProductFullReduction> productFullReductionList;

}
