package com.faity.auth.authorication.service;

import com.faity.auth.authorication.entity.PermissionDTO;
import org.springframework.security.access.ConfigAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Set;

public interface IPermissionService {

    /**
     * 动态新增更新权限
     *
     * @param resource
     */
    void savePermission(PermissionDTO umsPermissionPO);

    /**
     * 动态删除权限
     *
     * @param permissionDTO
     */
    void removeResource(PermissionDTO permissionDTO);

    /**
     * 加载权限资源数据
     */
    void loadResource();

    /**
     * 根据url和method查询到对应的权限信息
     *
     * @param authRequest
     * @return
     */
    ConfigAttribute findConfigAttributesByUrl(HttpServletRequest authRequest);

    /**
     * 根据用户名查询 该用户所拥有的角色对应的资源信息
     *
     * @param username
     * @return
     */
    Set<PermissionDTO> queryByUsername(String username);
}
