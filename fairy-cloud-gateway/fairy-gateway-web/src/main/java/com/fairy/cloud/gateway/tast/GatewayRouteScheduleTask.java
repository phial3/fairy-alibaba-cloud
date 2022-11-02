package com.fairy.cloud.gateway.tast;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.reactivestreams.Publisher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.cloud.gateway.route.RouteDefinitionRepository;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

import javax.annotation.Resource;
import java.util.Date;
import java.util.function.Function;

/**
 * 定时任务拉取同步更新路由信息
 * @author 鹿少年
 * @date 2022/11/2 19:17
 */
@Component
@Slf4j
public class GatewayRouteScheduleTask {

    @Autowired
    private RouteDefinitionRepository routeDefinitionRepository;
    @Resource
    private ApplicationEventPublisher applicationEventPublisher;


    @Scheduled(cron = "*/10 * * * * ?")
    public void scheduleTask(){
        log.info("动态刷新路由信息定时任务启动：{}", DateFormatUtils.format(new Date(),"yyyy-MM-dd HH:mm:ss"));
        routeDefinitionRepository.getRouteDefinitions().flatMap(new Function<RouteDefinition, Publisher<?>>() {
            @Override
            public Publisher<?> apply(RouteDefinition definition) {
                return routeDefinitionRepository.save(Mono.just(definition));
            }
        });
        applicationEventPublisher.publishEvent(this);
    }

}
