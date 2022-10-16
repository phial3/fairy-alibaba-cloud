package com.fairy.auth.authorization.demo;

import com.fairy.common.response.Result;
import io.swagger.annotations.ApiOperation;
import jdk.nashorn.internal.objects.annotations.Getter;
import org.checkerframework.checker.units.qual.A;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 鹿少年
 * @date 2022/10/14 0:12
 */
@RestController
@RequestMapping("/test")
public class DemoController {

    @ApiOperation(value = "测试auth认证")
    @GetMapping("/index")
    public Result result(){
        return Result.success("认证成功");
    }
}
