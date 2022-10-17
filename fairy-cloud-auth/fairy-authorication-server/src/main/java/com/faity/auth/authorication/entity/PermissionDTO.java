package com.faity.auth.authorication.entity;

import com.fairy.common.entity.po.BasePo;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 鹿少年
 * @date 2022/10/16 21:32
 */
@Data
@NoArgsConstructor
public class PermissionDTO extends BasePo {
    /**
     * 名称
     */
    private String name;
    /**
     * 权限值
     */
    private String value;
    /**
     * 权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）
     */
    private Integer type;
    /**
     * 前端资源路径
     */
    private String url;

    /**
     * 请求方法
     */
    private String method;
    /**
     * 启用状态；0->禁用；1->启用
     */
    private Integer status;
    /**
     * 排序
     */
    private Integer sort;
}
