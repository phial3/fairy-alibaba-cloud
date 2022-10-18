package com.faity.auth.authorication.provider;

import com.fairy.common.entity.dto.PermissionDTO;
import com.fairy.common.response.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Set;

/**
 * @author 鹿少年
 * @date 2022/10/17 19:18
 */
@FeignClient(name = "authorication-client", configuration = FeignConfig.class,fallback = PermissionProviderFallback.class)
public interface PermissionProvider {

    @GetMapping(value = "/permission/all")
    Result<Set<PermissionDTO>> perimissions();

    @GetMapping(value = "/permission/user/{username}")
    Result<Set<PermissionDTO>> perimissions(@PathVariable("username") String username);

}
