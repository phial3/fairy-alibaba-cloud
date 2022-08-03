package com.fairy.cloud.mbg.model.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 订单中所包含的商品
 *
 * @author é¹¿å°å¹´
 * @email
 * @date 2022-08-02 21:00:43
 */
@Data
@TableName("oms_order_item")
public class OmsOrderItemPO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId
    private Integer id;
    /**
     * 订单编号
     */
    private String orderSn;
    /**
     * 商品id
     */
    private Integer productId;
    /**
     * 商品图片
     */
    private String productPic;
    /**
     * 商品名称
     */
    private String productName;
    /**
     * 商品品牌名
     */
    private String productBrand;
    /**
     * 商品编号
     */
    private String productSn;
    /**
     * 销售价格
     */
    private BigDecimal productPrice;
    /**
     * 购买数量
     */
    private Integer productQuantity;

}
