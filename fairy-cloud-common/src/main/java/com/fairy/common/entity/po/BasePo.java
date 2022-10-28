package com.fairy.common.entity.po;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 鹿少年
 * @date 2022/10/13 20:22
 */
@Data
public class BasePo implements Serializable {

    @TableField(exist = false)
    public static final String DEFAULT_USERNAME = "system";

    @TableField(fill = FieldFill.INSERT)
    private String creator;

    @TableField(fill = FieldFill.INSERT)
    private Date createdTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updator;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updatedTime;
}
