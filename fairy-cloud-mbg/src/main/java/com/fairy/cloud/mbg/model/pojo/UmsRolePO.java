package com.fairy.cloud.mbg.model.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fairy.common.entity.po.BasePo;
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
public class UmsRolePO extends BasePo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId(type = IdType.AUTO)
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
     * 启用状态：0->禁用；1->启用
     */
    private Integer status;
    /**
     *
     */
    private Integer sort;

}
