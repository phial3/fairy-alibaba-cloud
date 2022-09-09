package com.fairy.cloud.product.ribbon;

import com.alibaba.cloud.nacos.ribbon.NacosRule;
import com.netflix.loadbalancer.IRule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;

/**
 * @author 鹿少年
 * @date 2022/8/18 21:10
 */

@Configuration
public class RibbonConfig {


    @Autowired
    private RestTemplateBuilder builder;

    @Primary
    @Bean
    @LoadBalanced
    public RestTemplate loadBalance() {
        RestTemplate restTemplate = builder.build();
        return restTemplate;
    }

   /* @Primary
    @Bean
    public RestTemplate loadBalance(RestTemplateBuilder builder, LoadBalancerClient loadBalancerClient) {
        RestTemplate restTemplate = builder.build();
        restTemplate.setInterceptors(Collections.singletonList(new LoadBalancerInterceptor(loadBalancerClient)));
        return restTemplate;
    }*/

    @Bean
    public RestTemplate restTemplate() {
        builder.setReadTimeout(Duration.ofSeconds(10000));
        RestTemplate restTemplate = builder.build();
        return restTemplate;
    }

 /*   @Bean
    public IRule rule() {
        return new NacosRule();
    }*/
}
