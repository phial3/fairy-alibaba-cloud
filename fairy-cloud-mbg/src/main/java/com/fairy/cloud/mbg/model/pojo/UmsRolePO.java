package com.fairy.cloud.mbg.model.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 后台用户角色表
 *
 * @author é¹¿å°å¹´
 * @email
 * @date 2022-08-02 21:00:44
 */
@Data
@TableName("ums_role")
public class UmsRolePO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId
    private Integer id;
    /**
     * 名称
     */
    private String name;
    /**
     * 描述
     */
    private String description;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 启用状态：0->禁用；1->启用
     */
    private Integer status;
    /**
     *
     */
    private Integer sort;

}
