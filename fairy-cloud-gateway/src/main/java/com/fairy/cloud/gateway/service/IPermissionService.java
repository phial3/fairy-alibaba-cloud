package com.fairy.cloud.gateway.service;

public interface IPermissionService {
    /**
     * @param authentication token
     * @param method 方法
     * @param url url路径
     * @return boolean
     */
    boolean permission(String authentication, String url, String method);
}
