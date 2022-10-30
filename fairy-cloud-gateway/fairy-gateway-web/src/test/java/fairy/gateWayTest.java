package fairy;

import com.fairy.cloud.gateway.GateWayApp;
import com.fairy.cloud.gateway.config.RouteLocalCache;
import com.fairy.cloud.gateway.routes.repository.RedisRouteDefinitionRepository;
import com.fairy.cloud.gateway.service.impl.RedisRouteService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
import org.springframework.cloud.gateway.route.*;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import javax.annotation.Resource;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/10/25 21:44
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = GateWayApp.class)
public class gateWayTest {

    @Resource
    private RouteLocatorBuilder routeLocatorBuilder;

    @Resource
    private RouteDefinitionLocator definitionLocator;
//
//    @Resource
//    private InMemoryRouteDefinitionRepository routeDefinitionRepository;

    @Autowired
    private RouteLocator routeLocator;
    @Resource
    private RedisRouteService routeService;
    @Resource
    private RedisRouteDefinitionRepository routeDefinitionRepository;
    @Resource
    private RouteLocalCache cache;

    @Test
    public void testGateWayRoute() {
        Flux<RouteDefinition> definitionFlux = definitionLocator.getRouteDefinitions();

        //新增
        RouteDefinition routeDefinition = new RouteDefinition();
        routeDefinition.setId("authorication-admin");
        List<PredicateDefinition> predicateDefinitionList = new ArrayList<>();
        PredicateDefinition predicateDefinition = new PredicateDefinition("Path=/admin/**");
        predicateDefinitionList.add(predicateDefinition);
        routeDefinition.setPredicates(predicateDefinitionList);
        routeDefinition.setUri(URI.create("lb://authorication-admin"));

        List< FilterDefinition > filters = new ArrayList<>();
        FilterDefinition filterDefinition = new FilterDefinition();
        filterDefinition.setName("RequestRateLimiter");
        HashMap map = new HashMap();
        map.put("deny-empty-key","false");
        map.put("redis-rate-limiter.replenishRate","1");
        map.put("redis-rate-limiter.burstCapacity","1");
        map.put("redis-rate-limiter.requestedTokens","1");
        map.put("key-resolver","#{@defaultGatewayKeyResolver}");

        filterDefinition.setArgs(map);

        filters.add(filterDefinition);
//        routeDefinition.setFilters(filters);

        routeDefinitionRepository.save(Mono.just(routeDefinition));

        routeService.save(routeDefinition);
    }
}
