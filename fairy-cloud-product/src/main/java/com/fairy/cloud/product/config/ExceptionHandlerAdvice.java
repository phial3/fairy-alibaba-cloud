package com.fairy.cloud.product.config;

import com.fairy.common.exception.CommonException;
import com.fairy.common.exception.GateWayException;
import com.fairy.common.response.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@Slf4j
@RestControllerAdvice
public class ExceptionHandlerAdvice {

    @ExceptionHandler(value = {GateWayException.class})
    public Result handle(GateWayException ex) {
        log.error("网关异常code:{},msg:{}", ex.getCode(),ex.getMessage());
        return Result.fail(ex.getMsg());
    }

    @ExceptionHandler(value = {CommonException.class})
    public Result excption(CommonException exception) {
        log.error("异常信息:{}",exception.getMessage());
        return Result.fail(exception.getMsg());
    }
    @ExceptionHandler(value = {Throwable.class})
    public Result trowble(Throwable exception) {
        log.error("异常信息:{}",exception.getMessage());
        return Result.fail(exception.getMessage());

    }
}
