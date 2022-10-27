package fairy;

import com.fairy.cloud.gateway.GateWayApp;
import com.fairy.cloud.gateway.config.LocalCache;
import com.fairy.cloud.gateway.service.impl.RouteService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.gateway.handler.predicate.PredicateDefinition;
import org.springframework.cloud.gateway.route.InMemoryRouteDefinitionRepository;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.cloud.gateway.route.RouteDefinitionLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import javax.annotation.Resource;
import java.net.URI;
import java.util.ArrayList;
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

    @Resource
    private InMemoryRouteDefinitionRepository routeDefinitionRepository;

    @Resource
    private RouteService routeService;
    //    @Resource
//    private RedisRouteDefinitionRepository routeDefinitionRepository;
    @Resource
    private LocalCache cache;

    @Test
    public void testGateWayRoute() {
        Flux<RouteDefinition> definitionFlux = definitionLocator.getRouteDefinitions();

        //新增
        RouteDefinition routeDefinition = new RouteDefinition();
        routeDefinition.setId("gateway121");
        List<PredicateDefinition> predicateDefinitionList = new ArrayList<>();
        PredicateDefinition predicateDefinition = new PredicateDefinition("Path=/gateway/authorization/**");
        predicateDefinitionList.add(predicateDefinition);
        routeDefinition.setPredicates(predicateDefinitionList);
        routeDefinition.setUri(URI.create("lb://fairy-cloud-gateway"));
        routeDefinitionRepository.save(Mono.just(routeDefinition));

        routeService.save(routeDefinition);
    }
}
