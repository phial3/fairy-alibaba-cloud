package com.fairy.auth.authorication.client.provider;

import com.fairy.common.entity.dto.PermissionDTO;
import com.fairy.common.enums.SentinelErrorEnum;
import com.fairy.common.response.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

//@FeignClient(name = "authorication-server", path = "/authorication",configuration = FeignConfig.class,fallbackFactory = AuthProviderFallbackFactory.class)
@FeignClient(name = "authorication-server", path = "/authorication",configuration = FeignConfig.class)
public interface AuthProvider {
    /**
     * 调用签权服务，判断用户是否有权限
     *
     * @param authentication
     * @param url
     * @param method
     * @return <pre>
     * Result:
     * {
     *   code:"000000"
     *   mesg:"请求成功"
     *   data: true/false
     * }
     * </pre>
     */
    @PostMapping(value = "/auth/permission")
    Result auth(@RequestHeader(HttpHeaders.AUTHORIZATION) String authentication, @RequestParam("url") String url, @RequestParam("method") String method);

    @PostMapping(value = "/auth/data/permission")
    Result dataAuth(@RequestHeader(HttpHeaders.AUTHORIZATION) String authentication, @RequestBody PermissionDTO permissionDTO);


}
