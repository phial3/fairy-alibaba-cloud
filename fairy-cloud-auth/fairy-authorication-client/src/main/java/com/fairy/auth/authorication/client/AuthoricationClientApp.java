package com.fairy.auth.authorication.client;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author 鹿少年
 * @date 2022/10/18 11:42
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages={"com.fairy.auth.authorication.client.provider"})
public class AuthoricationClientApp {
    public static void main(String[] args) {
        SpringApplication.run(AuthoricationClientApp.class,args);
    }
}
