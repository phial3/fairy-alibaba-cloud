package com.fairy.auth.authorization.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.LinkedHashSet;

/**
 * @author 鹿少年
 * @date 2022/10/16 19:21
 */
@Component
@Data
@ConfigurationProperties("oauth2.allow")
public class SkipUrls {

    private LinkedHashSet<String> urls;
}
