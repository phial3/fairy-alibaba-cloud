package com.faity.auth.authorication;

import com.alicp.jetcache.anno.config.EnableCreateCacheAnnotation;
import com.alicp.jetcache.anno.config.EnableMethodCache;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author 鹿少年
 * @date 2022/10/16 19:33
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@EnableMethodCache(basePackages = "com.faity.auth.authorication") //扫包，使@Cache生效
@EnableCreateCacheAnnotation //使@CreateCache生效
public class AuthenticatioServerApp {
    public static void main(String[] args) {
        SpringApplication.run(AuthenticatioServerApp.class, args);
    }

}
