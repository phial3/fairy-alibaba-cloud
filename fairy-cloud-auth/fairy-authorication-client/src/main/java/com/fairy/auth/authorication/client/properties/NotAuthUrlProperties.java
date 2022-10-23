package com.fairy.auth.authorication.client.properties;


import com.google.common.collect.Lists;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.LinkedHashSet;


/**
 * 类的描述:网关跳过认证的配置类
 */
@Component
@Data
@ConfigurationProperties("cloud.gateway")
public class NotAuthUrlProperties {

    private LinkedHashSet<String> shouldSkipUrls =new LinkedHashSet<String>(Lists.newArrayList("/oauth"));
}
