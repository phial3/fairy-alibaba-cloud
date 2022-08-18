package com.fairy.cloud.product;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author 鹿少年
 * @date 2022/8/1 14:22
 */
@SpringBootApplication
@EnableFeignClients(basePackages="com.fairy.cloud.api")
public class ProduceApp {
    public static void main(String[] args) {
        SpringApplication.run(ProduceApp.class, args);
    }
}
