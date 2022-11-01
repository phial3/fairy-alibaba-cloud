package com.fairy.cloud.gateway.routes.repository;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fairy.cloud.gateway.dao.GatewayRouteArgsDao;
import com.fairy.cloud.gateway.dao.GatewayRouteDao;
import com.fairy.cloud.gateway.entity.GatewayRouteArgsPO;
import com.fairy.cloud.gateway.entity.GatewayRouteDefinition;
import com.fairy.cloud.gateway.entity.GatewayRoutePO;
import com.fairy.cloud.gateway.util.GatewayContant;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.cloud.gateway.route.RouteDefinitionRepository;
import org.springframework.cloud.gateway.support.NotFoundException;
import org.springframework.data.redis.core.ReactiveStringRedisTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import java.net.URI;
import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Consumer;

@Slf4j
@Repository
public class MySQLRouteDefinitionRepository implements RouteDefinitionRepository {

    @Autowired
    private ReactiveStringRedisTemplate redisTemplate;
    @Autowired
    private GatewayRouteDao gatewayRouteDao;
    @Autowired
    private GatewayRouteArgsDao gatewayRouteArgsDao;

    /**
     * Gateway启动时会通过RouteDefinitionRouteLocator.getRoutes方法
     * 将路由规则RouteDefinition转换为Route
     * this.routeDefinitionLocator.getRouteDefinitions().map(this::convertToRoute);
     * 加载到内存中
     **/
    @Override
    public Flux<RouteDefinition> getRouteDefinitions() {
        List<GatewayRouteDefinition> routePOS = gatewayRouteDao.getGatewayRoute();
        return Flux.fromIterable(GatewayRouteDefinition.toRouteDefinition(routePOS));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Mono<Void> save(Mono<RouteDefinition> route) {
        return route.flatMap(r -> {
            if (ObjectUtils.isEmpty(r.getId())) {
                return Mono.error(new IllegalArgumentException("id may not be empty"));
            }
            GatewayRoutePO routePO = GatewayRoutePO.toGatewayRoute(r);
            List<GatewayRouteArgsPO> filter = GatewayRouteArgsPO.toGatewayRouteFilterArgs(r.getFilters());
            List<GatewayRouteArgsPO> predicate = GatewayRouteArgsPO.toGatewayRoutePredictArgs(r.getPredicates());
            //1:先查询
            GatewayRoutePO gatewayRoutePOS = gatewayRouteDao.findGatewayRouteById(r.getId());
            if (!Objects.isNull(gatewayRoutePOS)) {
                //更新
                gatewayRouteDao.updateGatewayRoute(routePO);
                gatewayRouteArgsDao.batchUpdateGatewayArgs(filter);
                gatewayRouteArgsDao.batchUpdateGatewayArgs(predicate);
            } else {
                //2: 保存
                gatewayRouteDao.saveGatewayRoute(routePO);
                gatewayRouteArgsDao.bathSaveGatewayArgs(filter);
                gatewayRouteArgsDao.bathSaveGatewayArgs(predicate);
            }

            return Mono.empty();
        });
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public Mono<Void> delete(Mono<String> routeId) {
        return  routeId.flatMap(r -> {
            if (ObjectUtils.isEmpty(r)) {
                return Mono.error(new IllegalArgumentException("id may not be empty"));
            }
            //删除路由以及路由 参数
            gatewayRouteDao.deleteRoute(r);

            //分别删除
            gatewayRouteDao.deleteRouteByRouteId(r);
            gatewayRouteArgsDao.deleteRouteArgsByRouteId(r);
            return Mono.empty();
        });
    }

}
