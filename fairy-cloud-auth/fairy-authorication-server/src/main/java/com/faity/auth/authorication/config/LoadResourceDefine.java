package com.faity.auth.authorication.config;

import com.faity.auth.authorication.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @author 鹿少年
 * @date 2022/10/16 21:29
 */
@Component
class LoadResourceDefine {

    @Autowired
    private IPermissionService permissionService;

    /**
     *取消返回的bean防止外部出现线程安全问题
     */
    @PostConstruct
    public void resourceConfigAttributes() {
        permissionService.loadResource();
    }
}

