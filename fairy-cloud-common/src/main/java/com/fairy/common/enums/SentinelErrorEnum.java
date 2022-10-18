package com.fairy.common.enums;

import lombok.Getter;

/**
 * @author 鹿少年
 * @date 2022/10/17 19:25
 */
@Getter
public enum  SentinelErrorEnum implements ErrorType {

    FLOW_RULE_ERR("050501", "触发流控"),
    HOT_PARAM_FLOW_RULE_ERR("050501", "热点参数流控了"),
    SYS_RULE_ERR("050501", "系统负载不满足"),
    DEGRADE_RULE_ERR("050501", "降级规则触发"),
    AUTH_RULE_ERR("050501","白名单认证出错")
    ;


    private String code;
    private String msg;

    SentinelErrorEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
