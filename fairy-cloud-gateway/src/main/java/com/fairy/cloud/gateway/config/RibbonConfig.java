package com.fairy.cloud.gateway.config;

import com.fairy.cloud.gateway.Component.CloudRestTemplate;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.cloud.client.loadbalancer.LoadBalancerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;


@Configuration
public class RibbonConfig {

    /**
     * 方法实现说明:原生的RestTemplate +@LB不行 因为在
     * InitializingBean方法执行前我们的RestTemplate还没有被增强
     * 需要自己改写RestTemplate
     */
    @Bean
    public CloudRestTemplate cloudRestTemplate(DiscoveryClient discoveryClient) {
        return new CloudRestTemplate(discoveryClient);
    }

    /**
     * 给RestTemplate提前注入LoadBalancerInterceptor
     *
     */
    @Bean
    public RestTemplate restTemplate(LoadBalancerClient loadBalancer){
        RestTemplate restTemplate = new RestTemplate();
        List<ClientHttpRequestInterceptor> interceptors = new ArrayList<>();
        // ribbon核心拦截器
        interceptors.add(new LoadBalancerInterceptor(loadBalancer));
        restTemplate.setInterceptors(interceptors);
        return restTemplate;
    }
}
