package com.fairy.cloud.gateway.service.impl;

import com.fairy.cloud.gateway.config.LocalCache;
import com.fairy.cloud.gateway.service.IRouteService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
public class RouteService implements IRouteService {

    private static final String GATEWAY_ROUTES = "gateway_routes::";

    @Resource
    private LocalCache cache;

    @Autowired
    private RedisTemplate redisTemplate;



    @PostConstruct
    private void loadRouteDefinition() {
        log.info("loadRouteDefinition, 开始初使化路由");
        Set<String> gatewayKeys = redisTemplate.keys(GATEWAY_ROUTES + "*");
        if (CollectionUtils.isEmpty(gatewayKeys)) {
            return;
        }
        log.info("预计初使化路由, gatewayKeys：{}", gatewayKeys);
        // 去掉key的前缀
        Set<String> gatewayKeyIds = gatewayKeys.stream().map(key -> {
            return key.replace(GATEWAY_ROUTES, StringUtils.EMPTY);
        }).collect(Collectors.toSet());
        Map<String, RouteDefinition> allRoutes = cache.getAll(gatewayKeyIds);
        log.info("gatewayKeys：{}", allRoutes);
        // 以下代码原因是，jetcache将RouteDefinition返序列化后，uri发生变化，未初使化，导致路由异常，以下代码是重新初使化uri
        allRoutes.values().forEach(routeDefinition -> {
            try {
                routeDefinition.setUri(new URI(routeDefinition.getUri().toASCIIString()));
            } catch (URISyntaxException e) {
                log.error("网关加载RouteDefinition异常：", e);
            }
        });
        cache.putAll(allRoutes);
        log.info("共初使化路由信息：{}", cache.getRouteMaps().size());
    }

    @Override
    public Collection<RouteDefinition> getRouteDefinitions() {
        return cache.getRouteMaps();
    }

    @Override
    public boolean save(RouteDefinition routeDefinition) {
        cache.put(routeDefinition.getId(), routeDefinition);
        log.info("新增路由1条：{},目前路由共{}条", routeDefinition, cache.getRouteMaps().size());
        return true;
    }

    @Override
    public boolean delete(String routeId) {
        cache.remove(routeId);
        log.info("删除路由1条：{},目前路由共{}条", routeId, cache.getRouteMaps().size());
        return true;
    }

}
