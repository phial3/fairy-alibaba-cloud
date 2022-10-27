package com.fairy.cloud.product;

import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.actuate.autoconfigure.metrics.MeterRegistryCustomizer;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;

/**
 * @author 鹿少年
 * @date 2022/8/1 14:22
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages="com.fairy.cloud.api")
public class ProduceApp {
    public static void main(String[] args) {
        SpringApplication.run(ProduceApp.class, args);
    }

    @Bean
    MeterRegistryCustomizer<MeterRegistry> configurer(@Value("${spring.application.name}") String applicationName){
        return registry -> registry.config().commonTags("application",applicationName);
    }

}
