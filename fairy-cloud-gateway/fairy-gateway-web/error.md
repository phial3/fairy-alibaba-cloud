## gateway启动报错
```
2022-10-23 16:10:40.447 ERROR [cloud-gateway,,,] 12872 --- [           main] io.netty.util.ResourceLeakDetector       : LEAK: HashedWheelTimer.release() was not called before it's garbage-collected. See https://netty.io/wiki/reference-counted-objects.html for more information.
Recent access records: 
Created at:
	io.netty.util.HashedWheelTimer.<init>(HashedWheelTimer.java:275)
	io.netty.util.HashedWheelTimer.<init>(HashedWheelTimer.java:218)
	io.netty.util.HashedWheelTimer.<init>(HashedWheelTimer.java:197)
	io.netty.util.HashedWheelTimer.<init>(HashedWheelTimer.java:179)
	io.netty.util.HashedWheelTimer.<init>(HashedWheelTimer.java:163)
	io.lettuce.core.resource.DefaultClientResources.<init>(DefaultClientResources.java:183)
	io.lettuce.core.resource.DefaultClientResources$Builder.build(DefaultClientResources.java:562)
	io.lettuce.core.resource.DefaultClientResources.create(DefaultClientResources.java:247)
	io.lettuce.core.AbstractRedisClient.<init>(AbstractRedisClient.java:105)
	io.lettuce.core.RedisClient.<init>(RedisClient.java:90)
	io.lettuce.core.RedisClient.create(RedisClient.java:127)
```
错误： https://github.com/redisson/redisson/issues/2636
lettcure版本过低
参考： https://www.w3cschool.cn/article/10106866.html
