package com.fairy.cloud.product.config;

import com.fairy.common.exception.CommonException;
import com.fairy.common.exception.GateWayException;
import com.fairy.common.response.CommonResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@Slf4j
@RestControllerAdvice
public class ExceptionHandlerAdvice {

    @ExceptionHandler(value = {GateWayException.class})
    public CommonResponse handle(GateWayException ex) {
        log.error("网关异常code:{},msg:{}", ex.getCode(),ex.getMessage());
        return CommonResponse.fail(ex.getMsg());
    }

    @ExceptionHandler(value = {CommonException.class})
    public CommonResponse excption(CommonException exception) {
        log.error("异常信息:{}",exception.getMessage());
        return CommonResponse.fail(exception.getMsg());
    }
    @ExceptionHandler(value = {Throwable.class})
    public CommonResponse trowble(Throwable exception) {
        log.error("异常信息:{}",exception.getMessage());
        return CommonResponse.fail(exception.getMessage());

    }
}
