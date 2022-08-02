package com.fairy.cloud.mbg.model.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

    import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 后台用户权限表
 *
 * @author é¹¿å°å¹´
 * @email 
 * @date 2022-08-02 21:07:38
 */
@Data
@TableName("ums_permission")
public class UmsPermissionPO implements Serializable {
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
            private String uri;
            /**
         * 启用状态；0->禁用；1->启用
         */
            private Integer status;
            /**
         * 创建时间
         */
            private Date createTime;
            /**
         * 排序
         */
            private Integer sort;
    
}
