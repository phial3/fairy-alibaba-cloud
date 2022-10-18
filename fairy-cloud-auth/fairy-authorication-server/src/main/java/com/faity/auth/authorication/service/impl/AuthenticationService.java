package com.faity.auth.authorication.service.impl;

import com.fairy.common.entity.dto.PermissionDTO;
import com.faity.auth.authorication.common.AuthenticationCommon;
import com.faity.auth.authorication.service.IAuthenticationService;
import com.faity.auth.authorication.service.IPermissionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Set;

@Service
@Slf4j
public class AuthenticationService implements IAuthenticationService {


    @Autowired
    private IPermissionService permissionService;


    /**
     * @param authRequest 访问的url,method
     * @return 有权限true, 无权限或全局资源中未找到请求url返回否
     */
    @Override
    public boolean decide(HttpServletRequest authRequest) {
        log.debug("正在访问的url是:{}，method:{}", authRequest.getServletPath(), authRequest.getMethod());
        //获取用户认证信息
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        //获取此url，method访问对应的权限资源信息
        ConfigAttribute urlConfigAttribute = permissionService.findConfigAttributesByUrl(authRequest);
        if (AuthenticationCommon.NONEXISTENT_URL.equals(urlConfigAttribute.getAttribute())){
            log.debug("url未在资源池中找到，拒绝访问");
        }

        //获取此访问用户所有角色拥有的权限资源
        List<PermissionDTO> userResources = findResourcesByUsername(authentication.getName());
        //用户拥有权限资源 与 url要求的资源进行对比
        return isMatch(urlConfigAttribute, userResources);
    }

    @Override
    public boolean dataDecide(PermissionDTO permissionDTO) {
        log.debug("正在访问的权限:{},路径:{}", permissionDTO.getName(), permissionDTO.getUrl());
        //获取用户认证信息
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        //判断用户是否有该路径权限
        User user = (User) authentication.getPrincipal();
        List<PermissionDTO> permissionDTOS = permissionService.queryByUsername(user.getUsername());
        return  isContainsPermission(permissionDTOS,permissionDTO);
    }


    /**
     * 校验权限是否匹配
     *
     * @param permissionDTOS 权限集合
     * @param permissionDTO   用户权限
     * @return boolean
     */
    public boolean isContainsPermission( List<PermissionDTO>  permissionDTOS, PermissionDTO permissionDTO) {
        //权限的父级继承
        for (PermissionDTO ums : permissionDTOS) {
            if(permissionDTO.getUrl().startsWith(ums.getUrl())) {
                return true;
            }
        }
        return false;
    }

    /**
     * url对应资源与用户拥有资源进行匹配
     *
     * @param urlConfigAttribute
     * @param userResources
     * @return
     */
    public boolean isMatch(ConfigAttribute urlConfigAttribute, List<PermissionDTO> userResources) {
        return userResources.stream().anyMatch(resource -> resource.getName().equals(urlConfigAttribute.getAttribute()));
    }

    /**
     * 根据用户所被授予的角色，查询到用户所拥有的资源
     *
     * @param username
     * @return
     */
    private List<PermissionDTO> findResourcesByUsername(String username) {
        //用户被授予的角色资源
        List<PermissionDTO> resources = permissionService.queryByUsername(username);
        if (log.isDebugEnabled()) {
            log.debug("用户被授予角色的资源数量是:{}, 资源集合信息为:{}", resources.size(), resources);
        }
        return resources;
    }
}
