package com.fairy.cloud.mbg.model.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

    import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 
 *
 * @author é¹¿å°å¹´
 * @email 
 * @date 2022-08-02 21:00:44
 */
@Data
@TableName("pms_stock")
public class PmsStockPO implements Serializable {
    private static final long serialVersionUID = 1L;

            /**
         * 
         */
                @TableId
            private Integer id;
            /**
         * 商品id
         */
            private Integer productId;
            /**
         * 库存数
         */
            private Integer stock;
            /**
         * 品牌id
         */
            private Integer brandId;
            /**
         * 创建时间
         */
            private Date creteTime;
            /**
         * 更新时间
         */
            private Date updateTime;
    
}
