package com.fairy.cloud.gateway.admin;

import com.alicp.jetcache.anno.config.EnableCreateCacheAnnotation;
import com.alicp.jetcache.anno.config.EnableMethodCache;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@EnableCircuitBreaker
@EnableMethodCache(basePackages = "com.fairy.cloud.gateway.admin")
@EnableCreateCacheAnnotation
@SpringBootApplication(scanBasePackages = {"com.fairy.cloud.gateway"})
public class GatewayAdmin {
    public static void main(String[] args) {
        SpringApplication.run(GatewayAdmin.class, args);
    }
}
