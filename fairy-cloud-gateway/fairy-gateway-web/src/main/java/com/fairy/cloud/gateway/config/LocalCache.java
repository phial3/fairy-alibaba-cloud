package com.fairy.cloud.gateway.config;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

/**
 * @author 鹿少年
 * @date 2022/10/21 20:33
 */
@Configuration
public class LocalCache {

    /**
     * map 缓存 动态路由信息
     */
    private Cache<String, RouteDefinition> routeDefinitionMaps;

    @PostConstruct
    private void init() {
        routeDefinitionMaps = CacheBuilder.newBuilder()
                //设置本地缓存容器的初始容量
                .initialCapacity(20)
                //设置本地缓存的最大容量
                .maximumSize(500)
                .concurrencyLevel(10)
                //设置访问缓存后多久过期
                .expireAfterAccess(60, TimeUnit.SECONDS)
                //设置写缓存后多少秒过期
                .expireAfterWrite(60, TimeUnit.SECONDS)
                .build();
    }

    public void put(String key, RouteDefinition object) {
        routeDefinitionMaps.put(key, object);
    }

    public RouteDefinition get(String key) {
        return routeDefinitionMaps.getIfPresent(key);
    }

    public Collection<RouteDefinition> getRouteMaps() {
        return routeDefinitionMaps.asMap().values();
    }

    public void remove(String routeId) {
        routeDefinitionMaps.asMap().remove(routeId);
    }

    public Map<String, RouteDefinition> getAll(Set<String> gatewayKeyIds) {
        Map<String, RouteDefinition> map = new ConcurrentHashMap<>();
        Iterator<String> iterator = gatewayKeyIds.iterator();
        while (iterator.hasNext()) {
            String id = iterator.next();
            if (routeDefinitionMaps.asMap().containsKey(id)) {
                map.put(id, routeDefinitionMaps.getIfPresent(id));
            }
        }
        return map;
    }

    public void putAll(Map<String, RouteDefinition> allRoutes) {
        routeDefinitionMaps.putAll(allRoutes);
    }
}
