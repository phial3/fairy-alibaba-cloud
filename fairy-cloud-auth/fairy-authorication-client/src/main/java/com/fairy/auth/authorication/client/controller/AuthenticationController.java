package com.fairy.auth.authorication.client.controller;

import com.fairy.auth.authorication.client.service.impl.AuthService;
import com.fairy.common.response.Result;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author 鹿少年
 * @date 2022/10/23 12:30
 */
@Api(tags = "认证客户端")
@RequestMapping
@RestController
public class AuthenticationController {

    @Autowired
    private AuthService authService;

    @RequestMapping(value = "/has/permission", method = RequestMethod.GET)
    public Result<Boolean> hasPermission(@RequestParam("authentication") String authentication,
                                         @RequestParam("url") String url,
                                         @RequestParam("method") String method) {
        boolean rs = authService.hasPermission(authentication, url, method);
        return Result.success(rs);
    }

    @GetMapping(value = "/get/jwt")
    public Result<Jws<Claims>> getJwt(@RequestParam("jwtToken") String jwtToken) {
        Jws<Claims> claimsJws = authService.getJwt(jwtToken);
        return Result.success(claimsJws);
    }

    @GetMapping(value = "/auth/url")
    public Result<Boolean> auhenticationUrl(@RequestParam("url") String url) {
        boolean rs = authService.ignoreAuthentication(url);
        return Result.success(rs);
    }
}
