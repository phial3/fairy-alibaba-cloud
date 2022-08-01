package com.fairy.cloud.gateway.exception;



import com.fairy.cloud.common.api.CommonResponse;
import com.fairy.cloud.common.exception.GateWayException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@Slf4j
@RestControllerAdvice
public class GateWayExceptionHandlerAdvice {

    @ExceptionHandler(value = {GateWayException.class})
    public CommonResponse handle(GateWayException ex) {
        log.error("网关异常code:{},msg:{}", ex.getCode(),ex.getMessage());
        return CommonResponse.fail(ex.getCode(),ex.getMessage());
    }

    @ExceptionHandler(value = {Throwable.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public CommonResponse handle(Throwable throwable) {
        log.error("异常信息:{}",throwable.getMessage());
        if(throwable instanceof GateWayException) {
            return handle((GateWayException) throwable);
        }else {
            return CommonResponse.fail();
        }
    }
}
