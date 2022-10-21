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

|  属性	 |  默认值 |  说明 |
|---|---|---|
| jetcache.statIntervalMinutes	 |  0 |  统计间隔，0表示不统计 |
|  jetcache.areaInCacheName	 | true  |  jetcache-anno把cacheName作为远程缓存key前缀，2.4.3以前的版本总是把areaName加在cacheName中，因此areaName也出现在key前缀中。2.4.4以后可以配置，为了保持远程key兼容默认值为true，但是新项目的话false更合理些。 |
|  jetcache.hiddenPackages | 无  |   @Cached和@CreateCache自动生成name的时候，为了不让name太长，hiddenPackages指定的包名前缀被截掉|
|  jetcache.[local/remote].${area}.type	 | 无  |缓存类型。tair、redis为当前支持的远程缓存；linkedhashmap、caffeine为当前支持的本地缓存类型   |
|  jetcache.[local/remote].${area}.keyConvertor	 | 无  |key转换器的全局配置，当前只有一个已经实现的keyConvertor：fastjson。仅当使用@CreateCache且缓存类型为LOCAL时可以指定为none，此时通过equals方法来识别key。方法缓存必须指定keyConvertor  |
|  jetcache.[local/remote].${area}.valueEncoder	 | java  |序列化器的全局配置。仅remote类型的缓存需要指定，可选java和kryo
 |
|jetcache.[local/remote].${area}.limit	| 100|每个缓存实例的最大元素的全局配置，仅local类型的缓存需要指定。注意是每个缓存实例的限制，而不是全部，比如这里指定100，然后用@CreateCache创建了两个缓存实例（并且注解上没有设置localLimit属性），那么每个缓存实例的限制都是100|
|jetcache.local.${area}.expireAfterAccessInMillis|0|需要jetcache2.2以上，以毫秒为单位，指定多长时间没有访问，就让缓存失效，当前只有本地缓存支持。0表示不使用这个功能。|

**cached注解**
```
name
缓存名称
key
缓存key,追加到name后面构成唯一的缓存key, 使用SpEL指定key，如果没有指定会根据所有参数自动生成。
expire
缓存失效时间
cacheType
缓存的类型，包括CacheType.REMOTE、CacheType.LOCAL、CacheType.BOTH。
说明：
CacheType.REMOTE 表示远程缓存 、CacheType.LOCAL 表示本地缓存 、CacheType.BOTH，如果定义为BOTH，会使用LOCAL和REMOTE组合成两级缓存
```
