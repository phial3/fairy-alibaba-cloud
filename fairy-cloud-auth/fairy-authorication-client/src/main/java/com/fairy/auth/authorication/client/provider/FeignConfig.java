package com.fairy.auth.authorication.client.provider;

import feign.Logger;
import feign.Request;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.TimeUnit;

/**
 * @author 鹿少年
 * @date 2022/10/18 12:17
 */
@Configuration
public class FeignConfig {

    @Bean
    public Logger.Level feignLoggerLevel() {
        return Logger.Level.BASIC;
    }

    @Bean
    public Request.Options options() {
        return new Request.Options(1, TimeUnit.SECONDS ,3,TimeUnit.SECONDS ,true);
    }

}
