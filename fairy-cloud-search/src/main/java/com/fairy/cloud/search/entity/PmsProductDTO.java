package com.fairy.cloud.search.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 商品 存储到ES的实体信息
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PmsProductDTO implements Serializable {

    private String id;
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
     * 销量
     */
    private Integer sale;
    /**
     * 价格
     */
    private BigDecimal price;

    /**
     *
     */
    private String keywords;
}
