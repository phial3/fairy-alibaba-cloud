package com.fairy.cloud.gateway.provider;

import com.fairy.common.response.Result;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author 鹿少年
 * @date 2022/10/21 20:48
 */
@FeignClient(name = "authorication-client", path = "/auth", fallbackFactory = AuthFeignFallbackFactory.class)
public interface AuthFeign {


    @RequestMapping(value = "/has/permission", method = RequestMethod.GET)
    Result<Boolean> hasPermission(@RequestParam("authentication") String authentication,
                                  @RequestParam("url") String url,
                                  @RequestParam("method") String method);

    @GetMapping(value = "/get/jwt")
    Result<Jws<Claims>> getJwt(@RequestParam("jwtToken") String jwtToken);

    @GetMapping(value = "/auth/url")
    Result<Boolean> auhenticationUrl(@RequestParam("url") String url);
}

