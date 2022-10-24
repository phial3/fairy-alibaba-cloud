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
