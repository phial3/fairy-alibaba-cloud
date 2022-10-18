package com.fairy.common.error;

import com.fairy.common.enums.ErrorType;
import com.fairy.common.enums.SystemErrorEnum;
import lombok.Getter;

/**
 * 业务异常
 * @author 鹿少年
 * @date 2022/10/13 21:06
 */
@Getter
public class ServiceException extends RuntimeException {

    private final ErrorType errorType;


    public ServiceException() {
        this.errorType = SystemErrorEnum.SYSTEM_ERROR;
    }

    public ServiceException(ErrorType errorType) {
        this.errorType = errorType;
    }

    public ServiceException(ErrorType errorType, String message) {
        super(message);
        this.errorType = errorType;
    }

    public ServiceException(ErrorType errorType, String message, Throwable cause) {
        super(message, cause);
        this.errorType = errorType;
    }

}
