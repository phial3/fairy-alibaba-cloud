package com.fairy.cloud.gateway.admin.config;

import com.fairy.cloud.gateway.admin.interceptor.UserInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.messaging.converter.MappingJackson2MessageConverter;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Stream;

@Configuration
public class WebServerMvcConfigurerAdapter implements WebMvcConfigurer {

    @Bean
    public HandlerInterceptor userInterceptor() {
        return new UserInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(userInterceptor());
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        //因为 StringHttpMessageConverter 会优先于 MappingJackson2HttpMessageConverter 所以需要调整顺序
        converters.stream().filter(x -> x instanceof MappingJackson2MessageConverter).flatMap(new Function<HttpMessageConverter<?>, Stream<?>>() {
            @Override
            public Stream<?> apply(HttpMessageConverter<?> httpMessageConverter) {
                //交换位置
                converters.set(converters.indexOf(httpMessageConverter),converters.get(0) );
                converters.set(0,httpMessageConverter );
                return Stream.of(httpMessageConverter);
            }
        });
    }
}
