# fairy-alibaba-cloud

#### 介绍
使用阿里 spring cloud开源组件开发 电商微服务项目

#### SkyGateWay 链路追踪接入
```
-javaagent:C://apache-skywalking//agent//skywalking-agent.jar 
-DSW_AGENT_COLLECTOR_BACKEND_SERVICES=node02:11800
-DSW_AGENT_NAME=fairy-cloud-gateway
```


## 日志收集存储
logstash下载： https://www.elastic.co/cn/downloads/past-releases/logstash-7-17-3
filebeat下载： https://www.elastic.co/cn/downloads/past-releases/filebeat-7-17-3

filebeat配置：

```
filebeat.inputs:

- type: log
  enabled: true
  paths:
    - C:\export\logs\*\*.log

  multiline.pattern: '^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}\.\d{3}'
  multiline.negate: true
  multiline.match: after


# ------------------------------ Logstash Output -------------------------------
output.logstash:
  hosts: ["node02:5044"]
```
### filebeat测试控制台输出


### 修改点
1: 下订单的 入参修改

