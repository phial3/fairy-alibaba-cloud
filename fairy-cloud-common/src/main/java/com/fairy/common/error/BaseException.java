package com.fairy.common.error;

import com.fairy.common.enums.ErrorType;
import com.fairy.common.enums.SystemErrorEnum;
import lombok.Getter;

/**
 * @author 鹿少年
 * @date 2022/10/13 21:05
 */
@Getter
public class BaseException extends RuntimeException {
    /**
     * 异常对应的错误类型
     */
    private final ErrorType errorType;


    public BaseException() {
        this.errorType = SystemErrorEnum.SYSTEM_ERROR;
    }

    public BaseException(ErrorType errorType) {
        this.errorType = errorType;
    }

    public BaseException(ErrorType errorType, String message) {
        super(message);
        this.errorType = errorType;
    }

    public BaseException(ErrorType errorType, String message, Throwable cause) {
        super(message, cause);
        this.errorType = errorType;
    }
}

