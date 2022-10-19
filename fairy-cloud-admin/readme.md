## zipkin链路日志

github地址： [https://github.com/openzipkin/zipkin](https://github.com/openzipkin/zipkin)

maven: 仓库地址： [https://mvnrepository.com/artifact/io.zipkin.java/zipkin](https://mvnrepository.com/artifact/io.zipkin.java/zipkin)  下载后缀为-exec 可执行的jar包

zipKin访问： http://ip//9411/zipkin

使用mysl存储数据：
[https://github.com/openzipkin/zipkin/blob/master/zipkin-server/src/main/resources/zipkin-server-shared.yml](https://github.com/openzipkin/zipkin/blob/master/zipkin-server/src/main/resources/zipkin-server-shared.yml)

SQL 语句：

```
zipkin jar里的sql文件
执行
java -jar zipkin-server-*.*.*-exec.jar --STORAGE_TYPE=mysql --MYSQL_HOST=127.0.0.1 --MYSQL_DB=zipkin --MYSQL_USER=root--MYSQL_PASS=root
```


zipKin官网调用链路图：

![输入图片说明](../images/zipkin/%E6%9C%8D%E5%8A%A1%E8%B0%83%E7%94%A8image.png)

