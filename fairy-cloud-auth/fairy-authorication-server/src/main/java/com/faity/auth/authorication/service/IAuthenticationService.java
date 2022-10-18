package com.faity.auth.authorication.service;

import com.fairy.common.entity.dto.PermissionDTO;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;

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
    boolean dataDecide(PermissionDTO permissionDTO);

}
