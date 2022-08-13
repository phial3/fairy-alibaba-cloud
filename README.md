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
关于链路不显示gateWay官网层的，需要拷贝agent/optional-plugins目录下的gateway插件到agent/plugins目录

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

配置 filebeat-logstash.yml

```
filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/filbeat/*.log
  multiline.pattern: '^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}\.\d{3}'
  multiline.negate: true
  multiline.match: after
#----------------------------- Logstash output --------------------------------
output.logstash:
  hosts: ["node02:5044"]
```

logstash解析 fileBeat输入的日志信息

```
input {
    beats {
        port => 5044
        codec => "json"
    }
}

filter {
    grok {
        match => {
          "message" => "(?<time>\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}\.\d{3})\s(?<level>\w{4,5})\s+\T\I\D\:\s*(?<trace_id>[0-9a-f.]{53,54})\s%{DATA:thread}\s%{DATA:class}\:%{GREEDYDATA:content}"
        }
    }
    mutate {
        remove_field => "message" # 删除原始日志内容节省存储和带宽
    }
}

output {
    elasticsearch {
        hosts => ["node02:9200"]
        index => "fairy-cloud-log" # ES 重建立索引
    }
}
```

启动logstash

```
bin/logstash -f config/logstash-trance.conf 
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

grok分析日志链接

http://node02:5601/app/kibana#/dev_tools/grokdebugger?_g=(refreshInterval:(pause:!t,value:0),time:(from:now%2Fd,mode:quick,to:now%2Fd))

翻墙链接：

http://grokdebug.herokuapp.com/

http://grokconstructor.appspot.com/

### Kibana展示查看
打开kibana页面
http://node02:5601/app/kibana#/home
进入manager http://node02:5601/app/kibana#/management?_g=() 新建一个index Patterns
![输入图片说明](images/kibana-index-patterns-1image.png)

打开 Discover  http://node02:5601/app/kibana#/discover?_g=()&_a=(columns:!(_source),index:d0bbde80-1afb-11ed-ba40-6375c3d223b8,interval:auto,query:(language:kuery,query:''),sort:!(!(_score,desc)))
![输入图片说明](images/kibana-index-discover-1image.png)

根据条件进行筛选：

![输入图片说明](images/kibana-index-discover-2image.png)

这时我们可以根据链路的tranceId来查询  筛选

![输入图片说明](images/kibana-index-discover-select-1image.png)


### 修改点
1: 下订单的 入参修改

