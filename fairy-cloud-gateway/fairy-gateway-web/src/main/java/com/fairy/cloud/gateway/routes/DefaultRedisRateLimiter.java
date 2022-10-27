package com.fairy.cloud.gateway.routes;//package com.fairy.cloud.gateway.routes;
//
//import com.fasterxml.jackson.annotation.JsonAutoDetect;
//import com.fasterxml.jackson.annotation.PropertyAccessor;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.cloud.gateway.filter.ratelimit.RedisRateLimiter;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
//import org.springframework.data.redis.core.ReactiveStringRedisTemplate;
//import org.springframework.data.redis.core.script.RedisScript;
//import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
//import org.springframework.data.redis.serializer.RedisSerializationContext;
//import org.springframework.validation.Validator;
//import reactor.core.publisher.Mono;
//
//import java.util.List;
//
///**
// * @author 鹿少年
// * @date 2022/10/18 20:33
// */
//@Configuration
//public class DefaultRedisRateLimiter extends RedisRateLimiter {
//
//    RedisRateLimiter.Config getDefaultConfig() {
//        return super.getConfig().get("defaultFilters");
//    }
//
//    public DefaultRedisRateLimiter(ReactiveStringRedisTemplate redisTemplate,
//                                   RedisScript<List<Long>> script,
//                                   @Qualifier("defaultValidator") Validator validator) {
//        super(redisTemplate, script, validator);
//    }
//
//
//    @Override
//    public Mono<Response> isAllowed(String routeId, String id) {
//        if (null == super.getConfig().get(routeId)){
//            getConfig().put(routeId, getDefaultConfig());
//        }
//        return super.isAllowed(routeId, id);
//    }
//}