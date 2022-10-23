package com.fairy.auth.authorication.client.provider;

import com.fairy.common.entity.dto.PermissionDTO;
import com.fairy.common.enums.SentinelErrorEnum;
import com.fairy.common.response.Result;
import org.springframework.stereotype.Component;

/**
 * @author 鹿少年
 * @date 2022/10/23 12:36
 */
@Component   //必须交给spring 管理
public class AuthProviderFallback implements AuthProvider {

    @Override
    public Result auth(String authentication, String url, String method) {
        return Result.fail(SentinelErrorEnum.FLOW_RULE_ERR);
    }

    @Override
    public Result dataAuth(String authentication, PermissionDTO permissionDTO) {
        return Result.fail(SentinelErrorEnum.FLOW_RULE_ERR);
    }
}