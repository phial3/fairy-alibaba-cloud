package com.fairy.cloud.gateway.routes;

import com.google.common.collect.Maps;
import com.google.common.util.concurrent.RateLimiter;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.ratelimit.AbstractRateLimiter;
import org.springframework.cloud.gateway.support.ConfigurationService;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

/**
 * 自定义限流规则
 * 注意这个类需要加上 Primary
 * @author 鹿少年
 * @date 2022/10/23 13:11
 */
@Component
@Slf4j
@Primary
public class DefaultGatewayRateLimiter extends AbstractRateLimiter<DefaultGatewayRateLimiter.Config> {

    /**
     * 和配置文件中的配置属性相对应
     */
    private static final String CONFIGURATION_PROPERTY_NAME = "default-gateway-rate-limiter";

    private RateLimiter rateLimiter = RateLimiter.create(1);

    protected DefaultGatewayRateLimiter(ConfigurationService configurationService) {
        super(DefaultGatewayRateLimiter.Config.class, CONFIGURATION_PROPERTY_NAME, configurationService);
    }

    @Override
    public Mono<Response> isAllowed(String routeId, String id) {
        log.info("网关默认的限流 routeId:[{}],id:[{}]", routeId, id);

        Config config = getConfig().get(routeId);

        return Mono.fromSupplier(() -> {
            boolean acquire = rateLimiter.tryAcquire(config.requestedTokens);
            if (acquire) {
                return new Response(true, Maps.newHashMap());
            } else {
                return new Response(false, Maps.newHashMap());
            }
        });
    }

    @Getter
    @Setter
    @ToString
    public static class Config {
        /**
         * 每次请求多少个 token
         */
        private Integer requestedTokens;
    }
}
