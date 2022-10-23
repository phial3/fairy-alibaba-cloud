package com.fairy.common.enums;

import lombok.Getter;

/**
 * @author 鹿少年
 * @date 2022/10/17 19:25
 */
@Getter
public enum ServiceErrorEnum implements ErrorType {

    SERVICE_ERROR("050501", "服务运行期间出错"),
    SERVICE_NOT_FOUND("050502", "服务查找不到"),
    PATH_NOT_FOUND("050503", "路径不存在"),
    ;


    private String code;
    private String msg;

    ServiceErrorEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
