package com.fairy.cloud.gateway.common;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author 鹿少年
 * @date 2022/7/30 12:50
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class GateWayResult implements Serializable {
    private boolean succuess;
    private String code;
    private String msg;
    private String body;
}
