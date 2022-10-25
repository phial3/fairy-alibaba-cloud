## Spring Cloud Sleuth
Spring Cloud Sleuth也是依据Dapper论文而诞生的，它的核心概念是：

```
Trace：一次分布式调用的链路踪迹
Span：一个方法（局部或远程）调用踪迹
Annotation：附着在Spane上的日志信息
Sampling：采样率（0-1，1是全采样）
```
引用Sleuth官方提供的示意图（[sleuth官网](https://cloud.spring.io/spring-cloud-sleuth/2.0.x/multi/multi__introduction.html)），将Span和Trace在一个系统中使用Zipkin注解的过程图形化：

![输入图片说明](../images/oath/sleuth%E9%93%BE%E8%B7%AF%E8%BF%BD%E8%B8%AAimage.png)

![输入图片说明](../images/oath/slethu%E5%AE%98%E7%BD%91image.png)

## Zipkin 

Zipkin 是一个开放源代码分布式的跟踪系统，由Twitter公司开源，它致力于收集服务的定时数据，以解决微服务架构中的延迟问题，包括数据的收集、存储、查找和展现，Zipkin的设计是基于谷歌的Google Dapper论文。

Zipkin的服务端已经打包成了一个 jar，使用 java -jar zipkin-server.jar 启动，访问 localhost:9411 查看zipkin主页

Zipkin官网地址：[https://zipkin.io/](https://zipkin.io/)，Zipkin收集 Sleuth 产生的数据，并以界面的形式呈现出来


## 异常错误
请在pom依赖中剔除web依赖 否则提示
***************************
APPLICATION FAILED TO START
***************************
Description:
Parameter 0 of method modifyResponseBodyGatewayFilterFactory in org.springframework.cloud.gateway.config.GatewayAutoConfiguration required a bean of type 'org.springframework.http.codec.ServerCodecConfigurer' that could not be found.

Action:
Consider defining a bean of type 'org.springframework.http.codec.ServerCodecConfigurer' in your configuration.


## 网关配置 限流
参考： https://segmentfault.com/a/1190000040643472

网关动态加载路由信息；RouteDefinition路由定义
Route的一种构建方式就是通过RouteDefinition，比如从properties文件中解析得到的路由规则定义

```
public class RouteDefinition {
    // 唯一id
    private String id;
        // 断言定义
    private List<PredicateDefinition> predicates = new ArrayList<>();
    // 过滤器定义
    private List<FilterDefinition> filters = new ArrayList<>();
    // 跳转uri
    private URI uri;
    // 元数据
    private Map<String, Object> metadata = new HashMap<>();
    // Spring优先级
    private int order = 0;
}
```
 **PredicateDefinition断言定义**
 从配置文件加载的断言定义，构造Route时，会用RoutePredicateFactory#applyAsync转换成AsyncPredicate

```
public class PredicateDefinition {
    private String name;
    private Map<String, String> args = new LinkedHashMap<>();
    public PredicateDefinition() {
    }
    // predicates:
    //     - Path=/echo // 解析'Path=/echo'放入args
    public PredicateDefinition(String text) {
        int eqIdx = text.indexOf('=');
        // 设置name
        setName(text.substring(0, eqIdx));
    
        String[] args = tokenizeToStringArray(text.substring(eqIdx + 1), ",");
        // 设置args
        for (int i = 0; i < args.length; i++) {
            this.args.put(NameUtils.generateName(i), args[i]);
        }
    }
}
```
 **FilterDefinition路由过滤器定义** 
从配置文件加载的路由过滤器定义，构造Route时，会用GatewayFilterFactory#apply转换为GatewayFilter

```
public class FilterDefinition {
    private String name;
    private Map<String, String> args = new LinkedHashMap<>();
    public FilterDefinition() {
    }
    // 解析配置文件 PrefixPath=/httpbin
    public FilterDefinition(String text) {
        int eqIdx = text.indexOf('=');
        if (eqIdx <= 0) {
            setName(text);
            return;
        }
        setName(text.substring(0, eqIdx));
 
        String[] args = tokenizeToStringArray(text.substring(eqIdx + 1), ",");
 
        for (int i = 0; i < args.length; i++) {
            this.args.put(NameUtils.generateName(i), args[i]);
        }
    }
}
```
 **Route路由对象** 

```
public class Route implements Ordered {
    // 唯一id
    private final String id;
    // 跳转uri
    private final URI uri;
    // SpringBean优先级
    private final int order;
    // 断言
    private final AsyncPredicate<ServerWebExchange> predicate;
    // 当前路由特有的过滤器
    private final List<GatewayFilter> gatewayFilters;
    // 元数据
    private final Map<String, Object> metadata;
}
```
RouteDefinitionLocator具有获取路由定义的能力

```
public interface RouteDefinitionLocator {
    Flux<RouteDefinition> getRouteDefinitions();
}
```

```
RouteDefinitionLocator 接口有四种实现 ：

PropertiesRouteDefinitionLocator ，从配置文件 (例如，YML / Properties 等) 读取。在 《Spring-Cloud-Gateway 源码解析 —— 路由（1.2）之 PropertiesRouteDefinitionLocator 配置文件》「2. PropertiesRouteDefinitionLocator」 详细解析。
RouteDefinitionRepository ，从存储器 (例如，内存 / Redis / MySQL 等) 读取。在 《Spring-Cloud-Gateway 源码解析 —— 路由（1.3）之 RouteDefinitionRepository 存储器》 详细解析。
DiscoveryClientRouteDefinitionLocator ，从注册中心 (例如，Eureka / Consul / Zookeeper / Etcd 等) 读取。在 《Spring-Cloud-Gateway 源码解析 —— 路由（1.4）之 DiscoveryClientRouteDefinitionLocator 注册中心》 详细解析。
CompositeRouteDefinitionLocator ，组合多种 RouteDefinitionLocator 的实现，为 RouteDefinitionRouteLocator 提供统一入口。在 本文 详细解析。
另外，CachingRouteDefinitionLocator 也是 RouteDefinitionLocator 的实现类，已经被 CachingRouteLocator 取代。
```
