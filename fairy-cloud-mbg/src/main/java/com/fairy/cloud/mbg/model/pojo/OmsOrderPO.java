package com.fairy.cloud.mbg.model.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

        import java.math.BigDecimal;
    import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 订单表
 *
 * @author é¹¿å°å¹´
 * @email 
 * @date 2022-08-02 21:00:43
 */
@Data
@TableName("oms_order")
public class OmsOrderPO implements Serializable {
    private static final long serialVersionUID = 1L;

            /**
         * 订单id
         */
                @TableId
            private Integer id;
            /**
         * 用户id
         */
            private Integer memberId;
            /**
         * 订单编号
         */
            private String orderSn;
            /**
         * 提交时间
         */
            private Date createTime;
            /**
         * 用户名
         */
            private String memberUsername;
            /**
         * 订单总金额
         */
            private BigDecimal totalAmount;
            /**
         * 应付金额（实际支付金额）
         */
            private BigDecimal payAmount;
            /**
         * 运费金额
         */
            private BigDecimal freightAmount;
            /**
         * 支付方式：0->未支付；1->支付宝；2->微信
         */
            private Integer payType;
            /**
         * 订单来源：0->PC订单；1->app订单
         */
            private Integer sourceType;
            /**
         * 订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单
         */
            private Integer status;
            /**
         * 物流公司(配送方式)
         */
            private String deliveryCompany;
            /**
         * 物流单号
         */
            private String deliverySn;
            /**
         * 自动确认时间（天）
         */
            private Integer autoConfirmDay;
            /**
         * 详细地址
         */
            private String receiverDetailAddress;
            /**
         * 订单备注
         */
            private String note;
            /**
         * 确认收货状态：0->未确认；1->已确认
         */
            private Integer confirmStatus;
            /**
         * 删除状态：0->未删除；1->已删除
         */
            private Integer deleteStatus;
            /**
         * 支付时间
         */
            private Date paymentTime;
            /**
         * 发货时间
         */
            private Date deliveryTime;
            /**
         * 确认收货时间
         */
            private Date receiveTime;
            /**
         * 评价时间
         */
            private Date commentTime;
    
}
