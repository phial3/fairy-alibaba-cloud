# fairy-alibaba-cloud

#### 介绍
使用阿里 spring cloud开源组件开发  根据电商的下单场景 使用相关组件实现服务功能

```
主要使用组件：
Nacos
Seata
Sentinel
GateWay
OAth2
Feign/Ribbon调用
SkayWalking链路分析
ELK日志分析
```

DB使用

```
Mysql
Redis
MongoDB
```



#### SkyGateWay 链路追踪接入
```
-javaagent:C://apache-skywalking//agent//skywalking-agent.jar 
-DSW_AGENT_COLLECTOR_BACKEND_SERVICES=node02:11800
-DSW_AGENT_NAME=fairy-cloud-gateway
```


## 日志收集存储
logstash下载： https://www.elastic.co/cn/downloads/past-releases/logstash-7-17-3
filebeat下载： https://www.elastic.co/cn/downloads/past-releases/filebeat-7-17-3

docker 安装配置filebeat logstash


docker启动filebeat指定配置文件

```
docker stop fileBeat  && docker rm fileBeat
docker run -d --name=fileBeat \
-v /mydata/fileBeat/fileBeat-logstash.yml:/usr/share/filebeat/fileBeat-logstash.yml \
-v /mydata/fileBeat/log:/var/log/filbeat \
elastic/filebeat:7.6.2  filebeat -e -c fileBeat-logstash.yml
```

logstash启动测试：

```
bin/logstash -e 'input { stdin { } } output { stdout {} }'
```




### filebeat测试控制台输出

```
# 输入
filebeat.inputs:
  # 标准输入
- type: stdin
  enabled: true
 
# 输出
# 输出到控制台
output.console:
  pretty: true
  enable: true
```

```
filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/filbeat/*.log
  multiline.pattern: '^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}\.\d{3}'
  multiline.negate: true
  multiline.match: after

output.console:
    pretty: true
    enable: true
```


### 修改点
1: 下订单的 入参修改

