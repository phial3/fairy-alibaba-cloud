## jetcache使用

**1:pom添加依赖**

```
<dependency>
    <groupId>com.alicp.jetcache</groupId>
    <artifactId>jetcache-starter-redis</artifactId>
    <version>2.6.0</version>
</dependency>
```
**2:yml配置**

`注意：yml配置中jetcache与spring对齐！！`
```

jetcache:
  statIntervalMinutes: 15
  areaInCacheName: false
  hidePackages: com.faity.auth.authorication  # 隐藏包
  local:
    # 短時本地緩存，主要用于要求时效较高的配置
    default:
      type: caffeine #jvm linkedhashmap
      keyConvertor: fastjson
      expireAfterWriteInMillis: 60000
      expireAfterAccessInMillis: 40000
    otherArea:
      type: linkedhashmap
      limit: 100
      keyConvertor: none
      expireAfterWriteInMillis: 100000
  remote:
    default:
      type: redis
      keyConvertor: fastjson
      valueEncoder: java
      valueDecoder: java
      poolConfig:
        minIdle: 5
        maxIdle: 20
        maxTotal: 50
      host: node01
      port: 63379
    otherArea:
      type: redis
      keyConvertor: fastjson
      valueEncoder: kryo
      valueDecoder: kryo
      poolConfig:
        minIdle: 5
        maxIdle: 20
        maxTotal: 50
      host: ${spring.redis.host}
      port: ${spring.redis.port}
```

**3:启动类配置**

```
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
@EnableMethodCache(basePackages = "com.faity.auth.authorication") //扫包，使@Cache生效
@EnableCreateCacheAnnotation //使@CreateCache生效
public class AuthenticatioServerApp {
    public static void main(String[] args) {
        SpringApplication.run(AuthenticatioServerApp.class, args);
    }

}
```

**4:注解使用：方法**

在spring环境下，使用@Cached注解可以为一个方法添加缓存，@CacheUpdate用于更新缓存，@CacheInvalidate用于移除缓存元素。
注解可以加在接口上也可以加在类上，加注解的类必须是一个spring bean
```
public interface UserService {

    @Cached(name="userCache.", key="#userId", expire = 3600)
    User getUserById(long userId);
 
    @CacheUpdate(name="userCache.", key="#user.userId", value="#user")
    void updateUser(User user);
 
    @CacheInvalidate(name="userCache.", key="#userId")
    void deleteUser(long userId);
    
}

```

注解使用：变量对象@CreateCache

```
@CreateCache(name = GATEWAY_ROUTES, cacheType = CacheType.REMOTE)
private Cache<String, RouteDefinition> gatewayRouteCache;
```


**使用代码配置**
```
    GenericObjectPoolConfig pc = new GenericObjectPoolConfig();
    pc.setMinIdle(2);
    pc.setMaxIdle(10);
    pc.setMaxTotal(10);
    JedisPool pool = new JedisPool(pc, "localhost", 6379);
    Cache<String, Goods> goodsCache = RedisCacheBuilder.createRedisCacheBuilder()
            .keyConvertor(FastjsonKeyConvertor.INSTANCE)
            .valueEncoder(JavaValueEncoder.INSTANCE)
            .valueDecoder(JavaValueDecoder.INSTANCE)
            .jedisPool(pool)
            .keyPrefix("goodsCache-")
            .expireAfterWrite(200, TimeUnit.SECONDS)
            .buildCache();

```


**logger输出统计信息**

当yml中的jetcache.statIntervalMinutes大于0时，通过@CreateCache和@Cached配置出来的Cache自带监控。
JetCache会按指定的时间定期通过logger输出统计信息。默认输出信息类似如下：

```
2022-10-21 19:15:00.036  INFO [authorication-admin,,,] 16316 --- [DefaultExecutor] c.alicp.jetcache.support.StatInfoLogger  : jetcache stat from 2022-10-21 19:12:42,783 to 2022-10-21 19:15:00,026
cache|       qps|   rate|           get|           hit|          fail|        expire|avgLoadTime|maxLoadTime
-----+----------+-------+--------------+--------------+--------------+--------------+-----------+-----------
-----+----------+-------+--------------+--------------+--------------+--------------+-----------+-----------
```

如果需要定制输出，可以这样做:


```
@Bean
public SpringConfigProvider springConfigProvider() {
    return new SpringConfigProvider(){
        public Consumer<StatInfo> statCallback() {
            // return new StatInfoLogger(false);
            ... // 实现自己的logger
        }
    };
}

<appender name="JETCACHE_LOGFILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
    <file>jetcache.log</file>
    <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
        <fileNamePattern>jetcache.log.%d{yyyy-MM-dd}</fileNamePattern>
        <maxHistory>30</maxHistory>
    </rollingPolicy>
 
    <encoder>
        <pattern>%-4relative [%thread] %-5level %logger{35} - %msg%n</pattern>
    </encoder>
</appender>
 
<logger name="com.alicp.jetcache" level="INFO" additivity="false">
    <appender-ref ref="JETCACHE_LOGFILE" />
</logger>

```

**jetcache参数配置**

