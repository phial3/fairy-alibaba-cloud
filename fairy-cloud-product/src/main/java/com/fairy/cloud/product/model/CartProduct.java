package com.fairy.cloud.product.model;

import com.fairy.cloud.mbg.model.PmsProduct;
import com.fairy.cloud.mbg.model.PmsProductAttribute;
import com.fairy.cloud.mbg.model.PmsSkuStock;
import lombok.Data;

import java.util.List;

/**
 * 购物车中选择规格的商品信息
 * Created by macro on 2018/8/2.
 */
@Data
public class CartProduct extends PmsProduct {
    private List<PmsProductAttribute> productAttributeList;
    private List<PmsSkuStock> skuStockList;

}
