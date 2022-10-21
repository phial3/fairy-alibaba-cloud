package com.fairy.auth.authorization;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author 鹿少年
 * @date 2022/10/13 23:52
 */
@SpringBootApplication
public class AuthorizationServerApp {
    public static void main(String[] args) {
        SpringApplication.run(AuthorizationServerApp.class, args);
    }
}

