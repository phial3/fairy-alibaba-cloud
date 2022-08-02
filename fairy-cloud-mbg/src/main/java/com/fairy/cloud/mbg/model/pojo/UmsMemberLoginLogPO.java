package com.fairy.cloud.mbg.model.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

    import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 会员登录记录
 *
 * @author é¹¿å°å¹´
 * @email 
 * @date 2022-08-02 21:00:44
 */
@Data
@TableName("ums_member_login_log")
public class UmsMemberLoginLogPO implements Serializable {
    private static final long serialVersionUID = 1L;

            /**
         * 
         */
                @TableId
            private Integer id;
            /**
         * 用户id
         */
            private Integer memberId;
            /**
         * 登陆时间
         */
            private Date createTime;
            /**
         * 登陆ip
         */
            private String ip;
            /**
         * 登陆城市
         */
            private String city;
            /**
         * 登录类型：0->PC；1->android;2->ios;3->小程序
         */
            private Integer loginType;
            /**
         * 登陆省份
         */
            private String province;
    
}
