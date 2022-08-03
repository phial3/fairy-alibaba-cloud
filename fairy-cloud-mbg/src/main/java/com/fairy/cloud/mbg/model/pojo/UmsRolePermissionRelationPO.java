package com.fairy.cloud.mbg.model.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 后台用户角色和权限关系表
 *
 * @author é¹¿å°å¹´
 * @email
 * @date 2022-08-02 21:00:44
 */
@Data
@TableName("ums_role_permission_relation")
public class UmsRolePermissionRelationPO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**
     * 角色id
     */
    private Integer roleId;
    /**
     * 权限id
     */
    private Integer permissionId;

}
