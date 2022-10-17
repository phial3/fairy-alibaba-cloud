package com.faity.auth.authorication.service;

import com.fairy.cloud.mbg.model.pojo.UmsPermissionPO;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

public interface IAuthenticationService {
    /**
     * 校验权限
     *
     * @param authRequest
     * @return 是否有权限
     */
    boolean decide(HttpServletRequest authRequest);

    /**
     * 数据决定
     * 校验数据权限
     *
     * @param permissionDTO 许可dto
     * @return 是否有权限
     */
    boolean dataDecide(UmsPermissionPO permissionDTO);

}
