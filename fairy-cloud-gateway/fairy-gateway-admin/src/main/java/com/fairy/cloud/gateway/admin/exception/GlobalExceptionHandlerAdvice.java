package com.fairy.cloud.gateway.admin.exception;

import com.fairy.common.enums.ServiceErrorEnum;
import com.fairy.common.enums.SystemErrorEnum;
import com.fairy.common.error.ServiceException;
import com.fairy.common.response.Result;
import io.netty.channel.ConnectTimeoutException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.ConstraintViolationException;
import java.security.SignatureException;

import static com.fairy.common.enums.SystemErrorEnum.ARGUMENT_NOT_VALID;

@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandlerAdvice {

    @ExceptionHandler(value = {ResponseStatusException.class})
    public Result handle(ResponseStatusException ex) {
        log.error("response status exception:{}", ex.getMessage());
        return Result.fail(SystemErrorEnum.GATEWAY_ERROR);
    }

    @ExceptionHandler(value = {ConnectTimeoutException.class})
    public Result handle(ConnectTimeoutException ex) {
        log.error("connect timeout exception:{}", ex.getMessage());
        return Result.fail(SystemErrorEnum.GATEWAY_CONNECT_TIME_OUT);
    }
//
//    @ExceptionHandler(value = {NotFoundException.class})
//    @ResponseStatus(HttpStatus.NOT_FOUND)
//    public Result handle(NotFoundException ex) {
//        log.error("not found exception:{}", ex.getMessage());
//        return Result.fail(SystemErrorEnum.GATEWAY_NOT_FOUND_SERVICE);
//    }

    @ExceptionHandler(value = {SignatureException.class})
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public Result handle(SignatureException ex) {
        log.error("SignatureException:{}", ex.getMessage());
        return Result.fail(SystemErrorEnum.INVALID_TOKEN);
    }

    @ExceptionHandler(value = {RuntimeException.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Result handle(RuntimeException ex) {
        log.error("runtime exception:{}", ex.getMessage());
        return Result.fail(ServiceErrorEnum.SERVICE_ERROR);
    }

    @ExceptionHandler(value = {Exception.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Result handle(Exception ex) {
        log.error("exception:{}", ex.getMessage());
        return Result.fail(SystemErrorEnum.SYSTEM_ERROR);
    }

    @ExceptionHandler(value = {ServiceException.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Result handle(ServiceException ex) {
        log.error("服务异常,msg:{}", ex.getMessage());
        return Result.fail(ex);
    }

    @ExceptionHandler(value = {MethodArgumentNotValidException.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Result handle(MethodArgumentNotValidException ex) {
        log.error("requestBody参数校验不通过异常,msg:{}", ex.getMessage());
        BindingResult result = ex.getBindingResult();
        StringBuilder sb = new StringBuilder("参数校验出错： ");
        for (FieldError error: result.getFieldErrors()){
            sb.append(error.getField()).append(":").append(error.getDefaultMessage()).append(",");
        }
        if(StringUtils.hasText(ex.getMessage())){
            return Result.fail(ARGUMENT_NOT_VALID,ex.getMessage());
        }
        return Result.fail(ARGUMENT_NOT_VALID);
    }
    @ExceptionHandler(value = {MethodArgumentNotValidException.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Result handle(ConstraintViolationException ex) {
        log.error("requestparam pathvariable 参数校验不通过异常,msg:{}", ex.getMessage());
        if(StringUtils.hasText(ex.getMessage())){
            return Result.fail(ARGUMENT_NOT_VALID,ex.getMessage());
        }
        return Result.fail(ARGUMENT_NOT_VALID);
    }
    @ExceptionHandler(value = {Throwable.class})
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Result handle(Throwable throwable) {
        if (throwable instanceof ResponseStatusException) {
            return handle((ResponseStatusException) throwable);
        } else if (throwable instanceof ConnectTimeoutException) {
            return handle((ConnectTimeoutException) throwable);
        }  else if (throwable instanceof ServiceException) {
            return handle((ServiceException) throwable);
        } else if (throwable instanceof RuntimeException) {
            return handle((RuntimeException) throwable);
        } else if (throwable instanceof MethodArgumentNotValidException) {
            return handle((MethodArgumentNotValidException) throwable);
        }else if (throwable instanceof Exception) {
            return handle((Exception) throwable);
        } else {
            return Result.fail();
        }
    }


}