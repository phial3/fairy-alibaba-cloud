package com.fairy.cloud.gateway.admin;

import com.alicp.jetcache.anno.config.EnableCreateCacheAnnotation;
import com.alicp.jetcache.anno.config.EnableMethodCache;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.gateway.config.GatewayClassPathWarningAutoConfiguration;

/**
 * @author 鹿少年
 * @date 2022/10/27 20:51
 */
@SpringBootApplication(exclude = GatewayClassPathWarningAutoConfiguration.class)
@EnableDiscoveryClient
@EnableCircuitBreaker
@EnableMethodCache(basePackages = "com.fairy.cloud.gateway")
@EnableCreateCacheAnnotation
public class GateWayAdminApp {
    public static void main(String[] args) {
        SpringApplication.run(GateWayAdminApp.class,args);config
    }
}
