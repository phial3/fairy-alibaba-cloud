package com.fairy.cloud.gateway.event;

import com.fairy.cloud.gateway.service.IRouteService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.stereotype.Component;

/**
 * @author 鹿少年
 * @date 2022/10/30 15:17
 */
@Component
@Slf4j
public class BusReceiver {

    @Autowired
    private IRouteService routeService;

    public void handleMessage(RouteDefinition routeDefinition) {
        log.info("Received Message:<{}>", routeDefinition);
        // 待实现动态del路由
        routeService.save(routeDefinition);
    }
}
