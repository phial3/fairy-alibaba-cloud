## zipkin链路日志

github地址： [https://github.com/openzipkin/zipkin](https://github.com/openzipkin/zipkin)

maven: 仓库地址： [https://mvnrepository.com/artifact/io.zipkin.java/zipkin](https://mvnrepository.com/artifact/io.zipkin.java/zipkin)  下载后缀为-exec 可执行的jar包

zipKin访问： http://ip//9411/zipkin   下载zipkin jar包： [https://search.maven.org/remote_content?g=io.zipkin&a=zipkin-server&v=LATEST&c=exec](https://search.maven.org/remote_content?g=io.zipkin&a=zipkin-server&v=LATEST&c=exec)

使用mysl存储数据：
[https://github.com/openzipkin/zipkin/blob/master/zipkin-server/src/main/resources/zipkin-server-shared.yml](https://github.com/openzipkin/zipkin/blob/master/zipkin-server/src/main/resources/zipkin-server-shared.yml)

建表语句： [https://github.com/openzipkin/zipkin/blob/master/zipkin-storage/mysql-v1/src/main/resources/mysql.sql](https://github.com/openzipkin/zipkin/blob/master/zipkin-storage/mysql-v1/src/main/resources/mysql.sql)

SQL 语句：

```
zipkin jar里的sql文件
执行
java -jar zipkin-server-2.23.19-exec.jar   --STORAGE_TYPE=mysql --MYSQL_HOST=node01 --MYSQL_DB=zipkin --MYSQL_USER=root --MYSQL_PASS=root  --MYSQL_TCP_PORT=33306 
```


zipKin官网调用链路图：

![输入图片说明](../images/zipkin/%E6%9C%8D%E5%8A%A1%E8%B0%83%E7%94%A8image.png)

rabbitMq 发送数据
```
java -jar zipkin-server-2.23.19-exec.jar   --zipkin.collector.rabbitmq.addresses=localhost --zipkin.collector.rabbitmq.username=admin--zipkin.collector.rabbitmq.password=admin
```
可配置的环境变量参考表

|  属性 | 环境变量  |  描述 |
|---|---|---|
| zipkin.collector.rabbitmq.concurrency  | RABBIT_CONCURRENCY  |  并发消费者数量，默认为 1 |
| zipkin.collector.rabbitmq.connection-timeout | RABBIT_CONNECTION_TIMEOUT |  建立连接时的超时时间，默认为 60000 毫秒，即 1 分钟|
| zipkin.collector.rabbitmq.queue| RABBIT_QUEUE	 |  从中获取 span 信息的队列，默认为 zipkin|
| zipkin.collector.rabbitmq.uri	 | RABBIT_URI | 符合 RabbitMQ URI 规范 的 URI，例如 amqp://user:pass@host:10000/vhost|
如果设置了URL，则以下属性将被忽略
|  属性 | 环境变量  |  描述 |
|---|---|---|
| zipkin.collector.rabbitmq.addresses| RABBIT_ADDRESSES	|  用逗号分隔的 RabbitMQ 地址列表，例如 localhost:5672,localhost:5673|
| zipkin.collector.rabbitmq.password| RABBIT_PASSWORD |  连接到 RabbitMQ 时使用的密码，默认为 guest|
| zipkin.collector.rabbitmq.username| RABBIT_USER|  连接到 RabbitMQ 时使用的用户名，默认为 guest|
| zipkin.collector.rabbitmq.virtual-host | RABBIT_VIRTUAL_HOST| 使用的 RabbitMQ virtual host，默认为 /|
| zipkin.collector.rabbitmq.use-ssl|RABBIT_USE_SSL|设置为 true 则用 SSL 的方式与 RabbitMQ 建立链接|

直接启动 以web方式

```
java -jar zipkin-server-2.23.19-exec.jar
```


ES作为存储方式
```
java -jar zipkin-server-2.9.4-exec.jar --zipkin.collector.rabbitmq.addresses=localhost  --STORAGE_TYPE=elasticsearch --ES_HOSTS=http://127.0.0.1:9200

```


```
java -jar zipkin-server-2.23.19-exec.jar --zipkin.collector.rabbitmq.addresses=node02:5672 --zipkin.collector.rabbitmq.password=admin 	--zipkin.collector.rabbitmq.username=admin --zipkin.collector.rabbitmq.virtual-host=/rabbitmq --STORAGE_TYPE=elasticsearch --ES_HOSTS=http://node02:9200
```
调用接口，查看链路

![输入图片说明](../images/zipkin/%E9%93%BE%E8%B7%AF%E8%B0%83%E7%94%A8%E6%8E%A5%E5%8F%A3image.png)


