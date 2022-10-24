## Prometheus 和 grafana 监控
docker安装可以参考我的这篇博客: [https://blog.csdn.net/huanglu0314/article/details/118387773](https://blog.csdn.net/huanglu0314/article/details/118387773)

prometheus 介绍参考我的这篇博客： [https://blog.csdn.net/huanglu0314/article/details/112178735](https://blog.csdn.net/huanglu0314/article/details/112178735)

 **docker-compass启动配置** 


```
 node-exporter:
    image: prom/node-exporter
    container_name: node_exporter
    restart: always
    networks:
      - elastic-work
    ports:
      - 9100:9100
  prometheus :
    image: prom/prometheus
    container_name: prometheus
    restart: always
    networks:
      - elastic-work
    ports:
      - 9090:9090
    volumes:
      - /mydata/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml
```
docker启动 node-exporter进入容器

```
 docker exec -it node_exporter /bin/sh
```
![输入图片说明](../images/promethus/node-export%E5%AE%B9%E5%99%A8image.png)

进入prometheus容器

```
[root@node01 mydata]# docker exec -it prometheus  /bin/sh
```
进入 cd /etc/prometheus/ 目录
将默认的prometheus.yml 从容器拷贝到宿主机

```
docker cp prometheus:/etc/prometheus/prometheus.yml prometheus.yml
```

原始 promethues.yml配置文件

```
# my global config
global:
  scrape_interval: 15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  # scrape_timeout is set to the global default (10s).

# Alertmanager configuration
alerting:
  alertmanagers:
    - static_configs:
        - targets:
          # - alertmanager:9093

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:
  # - "first_rules.yml"
  # - "second_rules.yml"

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: "prometheus"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["localhost:9090"]
```
修改prometheus.yml 文件

```
global:
  scrape_interval:     60s
  evaluation_interval: 60s
 
scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ['192.168.91.138:9090']
        labels:
          instance: prometheus
 
  - job_name: node
    static_configs:
      - targets: ['192.168.91.138:9100']
        labels:
          instance: node
```


## Pometheus 集成 Alertmanager 服务告警（邮件通知）


## Spring Boot Metrics监控之Prometheus
添加依赖

```
<dependency>
<groupId>org.springframework.boot</groupId>
<artifactId>spring-boot-starter-aop</artifactId>
</dependency>
<!--prometheus-->
<dependency>
<groupId>io.micrometer</groupId>
<artifactId>micrometer-registry-prometheus</artifactId>
<version>1.9.3</version>
</dependency>
```


applciation.yml配置
```
management:
endpoints:
web:
  exposure:
        include: '*'
  endpoint:
    health:
      show-details: always

  #采集数据
  metrics:
    tags:
      application: ${spring.application.name}
```
在启动主类中添加Bean ，此配置是监控 jvm 的：

```

@Bean
MeterRegistryCustomizer<MeterRegistry> configurer(@Value("${spring.application.name}") String applicationName){
return registry -> registry.config().commonTags("application",applicationName);
}
```
启动应用，访问 http://localhost:8088/actuator/prometheus ，可以看到应用的一些 metrics 信息



## Prometheus+Grafana 监控

