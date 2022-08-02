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
 * @date 2022-08-02 21:07:38
 */
@Data
@TableName("ums_member_role_relation")
public class UmsMemberRoleRelationPO implements Serializable {
    private static final long serialVersionUID = 1L;

            /**
         * 主键
         */
                @TableId
            private Integer id;
            /**
         * 用户Id
         */
            private Integer memeberId;
            /**
         * 角色Id
         */
            private Integer roleId;
    
}
