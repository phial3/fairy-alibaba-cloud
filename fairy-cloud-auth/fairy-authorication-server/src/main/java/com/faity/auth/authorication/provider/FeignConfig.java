package com.faity.auth.authorication.provider;

import feign.Logger;
import feign.Request;
import feign.codec.Decoder;
import feign.codec.Encoder;
import feign.jackson.JacksonDecoder;
import feign.jackson.JacksonEncoder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

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
        return new Request.Options(5000, 10000);
    }

    @Bean
    public Decoder decoder() {
        return new JacksonDecoder();
    }
    @Bean
    public Encoder encoder() {
        return new JacksonEncoder();
    }
}
