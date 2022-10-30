package com.fairy.cloud.gateway.properties;

import com.google.common.collect.Lists;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.LinkedHashSet;

/**
 * 网关跳过认证的配置类
 * @author 鹿少年
 * @date 2022/10/30 15:06
 */
@Component
@Data
@ConfigurationProperties("cloud.gateway")
public class NotAuthUrlProperties {

    private LinkedHashSet<String> shouldSkipUrls =new LinkedHashSet<String>(Lists.newArrayList("/oauth"));
}