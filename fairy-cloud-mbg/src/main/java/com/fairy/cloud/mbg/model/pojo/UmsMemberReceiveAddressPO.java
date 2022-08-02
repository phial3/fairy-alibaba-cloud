package com.fairy.cloud.mbg.model.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

    import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 会员收货地址表
 *
 * @author é¹¿å°å¹´
 * @email 
 * @date 2022-08-02 21:00:44
 */
@Data
@TableName("ums_member_receive_address")
public class UmsMemberReceiveAddressPO implements Serializable {
    private static final long serialVersionUID = 1L;

            /**
         * 
         */
                @TableId
            private Integer id;
            /**
         * 客户id
         */
            private Integer memberId;
            /**
         * 收货人名称
         */
            private String name;
            /**
         * 收人电话号码
         */
            private String phoneNumber;
            /**
         * 是否为默认
         */
            private Integer defaultStatus;
            /**
         * 邮政编码
         */
            private String postCode;
            /**
         * 省份/直辖市
         */
            private String province;
            /**
         * 城市
         */
            private String city;
            /**
         * 区
         */
            private String region;
            /**
         * 详细地址(街道)
         */
            private String detailAddress;
    
}
