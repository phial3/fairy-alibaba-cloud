package com.fairy.auth.authorication.client.provider;

import com.alibaba.csp.sentinel.slots.block.authority.AuthorityException;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeException;
import com.alibaba.csp.sentinel.slots.block.flow.FlowException;
import com.alibaba.csp.sentinel.slots.block.flow.param.ParamFlowException;
import com.alibaba.csp.sentinel.slots.system.SystemBlockException;
import com.fairy.common.entity.dto.PermissionDTO;
import com.fairy.common.enums.SentinelErrorEnum;
import com.fairy.common.enums.ServiceErrorEnum;
import com.fairy.common.error.ServiceException;
import com.fairy.common.response.Result;
import feign.hystrix.FallbackFactory;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import org.springframework.stereotype.Component;

///**
// * @author 鹿少年
// * @date 2022/10/23 12:37
// */
//@Component
public class AuthProviderFallbackFactory implements FallbackFactory<AuthProvider> {

    @Override
    public AuthProvider create(Throwable cause) {
        Result result;
        if (cause instanceof FlowException) {
            result = Result.fail(SentinelErrorEnum.FLOW_RULE_ERR);
        } else if (cause instanceof ParamFlowException) {
            result = Result.fail(SentinelErrorEnum.HOT_PARAM_FLOW_RULE_ERR);
        } else if (cause instanceof AuthorityException) {
            result = Result.fail(SentinelErrorEnum.AUTH_RULE_ERR);
        } else if (cause instanceof DegradeException) {
            result = Result.fail(SentinelErrorEnum.DEGRADE_RULE_ERR);
        } else if (cause instanceof SystemBlockException) {
            result = Result.fail(SentinelErrorEnum.SYS_RULE_ERR);
        } else {
            result = Result.fail(ServiceErrorEnum.SERVICE_ERROR);
        }

        return new AuthProvider() {

            @Override
            public Result auth(String authentication, String url, String method) {
                return result;
            }

            @Override
            public Result dataAuth(String authentication, PermissionDTO permissionDTO) {
                return result;
            }
        };
    }
}
