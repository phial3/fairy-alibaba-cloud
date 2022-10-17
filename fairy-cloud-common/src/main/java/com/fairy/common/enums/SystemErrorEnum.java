package com.fairy.common.enums;

import lombok.Getter;

/**
 * @author 鹿少年
 * @date 2022/10/13 20:57
 */
@Getter
public enum  SystemErrorEnum implements ErrorType{

    SYSTEM_ERROR("-1", "系统异常"),
    SYSTEM_BUSY("000001", "系统繁忙,请稍候再试"),

    GATEWAY_NOT_FOUND_SERVICE("010404", "服务未找到"),
    GATEWAY_ERROR("010500", "网关异常"),
    GATEWAY_CONNECT_TIME_OUT("010500", "网关超时"),

    ARGUMENT_NOT_VALID("010405", "请求参数校验不通过"),
    INVALID_TOKEN("010405", "无效token"),
    UPLOAD_FILE_SIZE_LIMIT("010301", "上传文件大小超过限制"),

    DUPLICATE_PRIMARY_KEY("010500","唯一键冲突");

    ;


    private String code;
    private String msg;

    SystemErrorEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
