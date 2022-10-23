package com.fairy.cloud.gateway.provider;

import com.fairy.common.enums.SentinelErrorEnum;
import com.fairy.common.response.Result;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author 鹿少年
 * @date 2022/10/23 12:36
 */
@Component   //必须交给spring 管理
public class AuthFeignFallback implements AuthFeign {

    //指定本地方法
    @Override
    public Result hasPermission(@RequestParam("authentication") String authentication,
                                @RequestParam("url") String url,
                                @RequestParam("method") String method){
        return Result.fail(SentinelErrorEnum.FLOW_RULE_ERR);
    }

    @Override
    public Result<Jws<Claims>> getJwt(String jwtToken) {
        return Result.fail(SentinelErrorEnum.FLOW_RULE_ERR);
    }

    @Override
    public Result<Boolean> auhenticationUrl(String url) {
        return Result.fail(SentinelErrorEnum.FLOW_RULE_ERR);
    }
}