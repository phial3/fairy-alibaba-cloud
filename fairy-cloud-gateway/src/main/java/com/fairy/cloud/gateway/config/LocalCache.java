package com.fairy.cloud.gateway.config;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * @author 鹿少年
 * @date 2022/10/21 20:33
 */
@Component
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
                .expireAfterAccess(60, TimeUnit.SECONDS)
                .refreshAfterWrite(100, TimeUnit.SECONDS)
                //设置写缓存后多少秒过期
                .expireAfterWrite(60, TimeUnit.SECONDS).build();
    }

    public  void put(String key, RouteDefinition object) {
        routeDefinitionMaps.put(key, object);
    }

    public  RouteDefinition get(String key) {
        return routeDefinitionMaps.getIfPresent(key);
    }

    public Collection<RouteDefinition> getRouteMaps(){
        return routeDefinitionMaps.asMap().values();
    }

    public void remove(String routeId) {
        routeDefinitionMaps.asMap().remove(routeId);
    }
}
