package com.fairy.auth.authorication.client.service;

import com.fairy.common.entity.dto.PermissionDTO;

import java.util.Set;

/**
 * @author 鹿少年
 * @date 2022/10/18 11:47
 */
public interface IPermissionService {
    /**
     * 查询所以权限
     * @return
     */
    Set<PermissionDTO> allPermissions();

    /**
     * 根据用户查询所属权限
     * @param username
     * @return
     */
    Set<PermissionDTO> selectPermissionsByUserName(String username);
}
