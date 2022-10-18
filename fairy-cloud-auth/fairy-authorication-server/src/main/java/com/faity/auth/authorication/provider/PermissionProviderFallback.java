package com.faity.auth.authorication.provider;

import com.fairy.common.entity.dto.PermissionDTO;
import com.fairy.common.enums.SentinelErrorEnum;
import com.fairy.common.response.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 必须交给spring管理
 * sentinel 整合 openFegin
 * @author 鹿少年
 * @date 2022/10/17 19:20
 */
@Component
@Slf4j
public class PermissionProviderFallback implements PermissionProvider{
    @Override
    public Result<List<PermissionDTO>> perimissions() {
        log.error("认证服务启动时加载资源异常！未加载到资源");
        return Result.fail(SentinelErrorEnum.FLOW_RULE_ERR);
    }

    @Override
    public Result<List<PermissionDTO>>perimissions(String username){
        log.error("认证服务查询用户异常！查询用户资源为空！");
        return Result.fail(SentinelErrorEnum.FLOW_RULE_ERR);
    }


}
