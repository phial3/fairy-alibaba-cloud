## Prometheus 和 grafana 监控
docker安装可以参考我的这篇博客: [https://blog.csdn.net/huanglu0314/article/details/118387773](https://blog.csdn.net/huanglu0314/article/details/118387773)

prometheus 介绍参考我的这篇博客： [https://blog.csdn.net/huanglu0314/article/details/112178735](https://blog.csdn.net/huanglu0314/article/details/112178735)

 **docker-compass启动配置** 


```
这里输入代码
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
