package com.fairy.authorication.resouce;

import com.alicp.jetcache.anno.config.EnableCreateCacheAnnotation;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author 鹿少年
 * @date 2022/10/18 23:16
 */
@SpringBootApplication
@EnableDiscoveryClient
//@EnableCircuitBreaker
//@EnableMethodCache(basePackages = "com.fairy.authorication.resouce")
@EnableCreateCacheAnnotation
public class AuthoricationAdminApp {
    public static void main(String[] args) {
        SpringApplication.run(AuthoricationAdminApp.class,args);
    }
}
