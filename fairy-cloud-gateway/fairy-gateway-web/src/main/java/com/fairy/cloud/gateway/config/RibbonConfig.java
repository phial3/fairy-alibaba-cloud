package com.fairy.cloud.gateway.config;

import com.alibaba.cloud.sentinel.annotation.SentinelRestTemplate;
import com.alibaba.cloud.sentinel.rest.SentinelClientHttpResponse;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.baomidou.mybatisplus.extension.api.R;
import com.fairy.common.enums.SentinelErrorEnum;
import com.fairy.common.response.Result;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.cloud.client.loadbalancer.LoadBalancerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpRequestExecution;
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
    @LoadBalanced
    @SentinelRestTemplate(
            blockHandler = "handleException",blockHandlerClass = GlobalExceptionUtil.class,
            fallback = "fallback",fallbackClass = GlobalExceptionUtil.class
    )
    public RestTemplate restTemplate(LoadBalancerClient loadBalancer) {
        RestTemplate restTemplate = new RestTemplate();
        List<ClientHttpRequestInterceptor> interceptors = new ArrayList<>();
        // ribbon核心拦截器
        interceptors.add(new LoadBalancerInterceptor(loadBalancer));
        restTemplate.setInterceptors(interceptors);
        return restTemplate;
    }
}

class GlobalExceptionUtil{
    public static SentinelClientHttpResponse handleException(HttpRequest request,
                                                             byte[] body, ClientHttpRequestExecution execution, BlockException ex) {
        Result r = Result.fail(SentinelErrorEnum.FLOW_RULE_ERR);
        try {
            return new SentinelClientHttpResponse(new ObjectMapper().writeValueAsString(r));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static SentinelClientHttpResponse fallback(HttpRequest request,
                                                      byte[] body, ClientHttpRequestExecution execution, BlockException ex) {
        Result r = Result.fail(SentinelErrorEnum.DEGRADE_RULE_ERR);
        try {
            return new SentinelClientHttpResponse(new ObjectMapper().writeValueAsString(r));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
