package com.fairy.bloom;

import com.fairy.cloud.product.ProduceApp;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.redisson.Redisson;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;
import org.redisson.client.RedisClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author 鹿少年
 * @date 2022/8/1 18:35
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = ProduceApp.class)
public class BloomTest {
    @Autowired
    private RedissonClient redisClient;

    @Test
    public void testBloom(){
        //初始化过滤器
        RBloomFilter<Object> bloomFilter = redisClient.getBloomFilter("testBloomFilter");
        bloomFilter.tryInit(1000000L,0.05);
        //插入元素
        bloomFilter.add("zhangsan");
        bloomFilter.add("lisi");
        //判断元素是否存在
        boolean flag = bloomFilter.contains("lisi");
        System.out.println(flag);
    }
}
