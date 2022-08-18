package com.fairy.cloud.api.feign.config;

import feign.Logger;
import feign.Request;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author huanglulu
 * @version 1.0
 * @createTime 2022/3/31 23:39
 */
@Configuration
public class FeignConfig {
    /**
     * 日志级别
     * 通过源码可以看到日志等级有 4 种，分别是：
     * NONE：不输出日志。
     * BASIC：只输出请求方法的 URL 和响应的状态码以及接口执行的时间。
     * HEADERS：将 BASIC 信息和请求头信息输出。
     * FULL：输出完整的请求信息。
     */
    @Bean
    public Logger.Level feignLoggerLevel() {
        return Logger.Level.BASIC;
    }

    /**
     * 使用Feign原生的注解配置
     */
//    @Bean
//    public Contract contract() {
//        return new Contract.Default();
//    }

    /*
        @Bean
        public Decoder decoder() {
            return new JacksonDecoder();
        }

        @Bean
        public Encoder encoder() {
            return new JacksonEncoder();
        }*/

    @Value("${service.feign.connectTimeout:5000}")
    private int connectTimeout;

    @Value("${service.feign.readTimeOut:5000}")
    private int readTimeout;

    @Bean
    public Request.Options options() {
        return new Request.Options(connectTimeout, readTimeout);
    }


    /**
     * 配置HttpClient
     */
    @Bean
    public HttpClient httpClient(HttpClientBuilder httpClientBuilder) {
        return httpClientBuilder.build();
    }

    @Bean
    public PoolingHttpClientConnectionManager manager() {
        PoolingHttpClientConnectionManager manager = new PoolingHttpClientConnectionManager();
        manager.setMaxTotal(1000);
        manager.setDefaultMaxPerRoute(200);
        return manager;
    }

    @Bean
    public HttpClientBuilder httpClientBuilder(PoolingHttpClientConnectionManager manager) {
        RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(3000).setSocketTimeout(1500)
                .setConnectionRequestTimeout(1500).build();

        HttpClientBuilder builder = HttpClientBuilder.create();
        builder.setConnectionManager(manager);
        builder.setDefaultRequestConfig(requestConfig);
        builder.setRetryHandler(new DefaultHttpRequestRetryHandler(0, false));
        return builder;
    }
}