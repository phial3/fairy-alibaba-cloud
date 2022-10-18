//package com.fairy.cloud.gateway.exception.gateway;
//
//import org.springframework.beans.factory.ObjectProvider;
//import org.springframework.boot.web.reactive.error.ErrorWebExceptionHandler;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.annotation.Order;
//import org.springframework.http.codec.ServerCodecConfigurer;
//import org.springframework.web.reactive.result.view.ViewResolver;
//
//import java.util.Collections;
//import java.util.List;
//
/////**
//// * @author 鹿少年
//// * @date 2022/7/30 12:17
//// */
////@Configuration
//@Deprecated
//public class GloablException {
//
//    @Bean
//    @Order(-1)
//    public ErrorWebExceptionHandler errorWebExceptionHandler(
//            ObjectProvider<List<ViewResolver>> viewResolversProvider,
//            ServerCodecConfigurer serverCodecConfigurer){
//        GlobalJsonExceptionHandler exceptionHandler = new GlobalJsonExceptionHandler();
//
//        exceptionHandler.setViewResolvers(viewResolversProvider.getIfAvailable(Collections::emptyList));
//        exceptionHandler.setMessageWriters(serverCodecConfigurer.getWriters());
//        exceptionHandler.setMessageReaders(serverCodecConfigurer.getReaders());
//
//        return exceptionHandler;
//    }
//}