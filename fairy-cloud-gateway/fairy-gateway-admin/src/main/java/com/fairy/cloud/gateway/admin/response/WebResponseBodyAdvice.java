package com.fairy.cloud.gateway.admin.response;

import com.fairy.common.response.Result;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/**
 * ResponseBodyAdvice 是对controller的内容在HttpMessageConverter进行类型转换之前拦截，进行相应处理后再讲结果返回给客户端
 */
@RestControllerAdvice
public class WebResponseBodyAdvice implements ResponseBodyAdvice {

    ObjectMapper mapper = new ObjectMapper();
    /**
     * 判断是否要交给beforeBodyWrite执行，true需要 false不需要
     * @param methodParameter
     * @param aClass
     * @return
     */
    @Override
    public boolean supports(MethodParameter methodParameter, Class aClass) {
        //
        return true;
    }

    /**
     * 对response进行具体的处理
     * @param o the body to be written
     * @param methodParameter the return type of the controller method
     * @param mediaType the content type selected through content negotiation
     * @param aClass the converter type selected to write to the response
     * @param serverHttpRequest the current request
     * @param serverHttpResponse the current response
     * @return
     */
    @Override
    public Object beforeBodyWrite(Object o, MethodParameter methodParameter, MediaType mediaType, Class aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        /**
         * string类型是会转换一次， String类型的selectedConverterType参数值是 StringHttpMessageConverter 而其他类型是 MappingJackson2HttpMessageConverter
         */
        if(o instanceof Result){
            return o;
        }
        if(o instanceof String){
            try {
                return this.mapper.writeValueAsString(o);
            } catch (JsonProcessingException e) {
                throw new RuntimeException(e);
            }
        }
        return Result.success(o);
    }
}
