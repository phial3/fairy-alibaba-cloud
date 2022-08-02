package com.fairy.cloud.mbg.model.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 商品信息
 *
 * @author é¹¿å°å¹´
 * @email
 * @date 2022-08-02 21:00:44
 */
@Data
@TableName("pms_product")
public class PmsProductPO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId
    private Integer id;
    /**
     * 品牌id
     */
    private Integer brandId;
    /**
     * 商品编号
     */
    private String productSn;
    /**
     * 商品名称
     */
    private String name;
    /**
     * 图片
     */
    private String pic;
    /**
     * 删除状态：0->未删除；1->已删除
     */
    private Integer deleteStatus;
    /**
     * 上架状态：0->下架；1->上架
     */
    private Integer publishStatus;
    /**
     * 新品状态:0->不是新品；1->新品
     */
    private Integer newStatus;
    /**
     * 推荐状态；0->不推荐；1->推荐
     */
    private Integer recommandStatus;
    /**
     * 审核状态：0->未审核；1->审核通过
     */
    private Integer verifyStatus;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 销量
     */
    private Integer sale;
    /**
     * 价格
     */
    private BigDecimal price;
    /**
     * 促销价格
     */
    private BigDecimal promotionPrice;
    /**
     * 商品描述
     */
    private String description;
    /**
     * 市场价
     */
    private BigDecimal originalPrice;
    /**
     * 商品重量，默认为克
     */
    private BigDecimal weight;
    /**
     *
     */
    private String keywords;

}
