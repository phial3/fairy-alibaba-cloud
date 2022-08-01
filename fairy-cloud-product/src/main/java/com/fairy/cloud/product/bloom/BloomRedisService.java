package com.fairy.cloud.product.bloom;

import com.google.common.base.Preconditions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;


/**
 * 布隆过滤器service
 */
@Component
public class BloomRedisService {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Autowired
    private MyBloomFilter myBloomFilter;


    /**
     * 根据给定的布隆过滤器添加值
     */
    public <T> void addByBloomFilter(String key, T value) {
        Preconditions.checkArgument(myBloomFilter != null, "bloomFilterHelper不能为空");
        int[] offset = myBloomFilter.murmurHashOffset(value);
        for (int i : offset) {
            redisTemplate.opsForValue().setBit(key, i, true);
        }
    }

    /**
     * 根据给定的布隆过滤器判断值是否存在
     */
    public <T> boolean includeByBloomFilter(String key, T value) {
        Preconditions.checkArgument(myBloomFilter != null, "bloomFilterHelper不能为空");
        int[] offset = myBloomFilter.murmurHashOffset(value);
        for (int i : offset) {
            if (!redisTemplate.opsForValue().getBit(key, i)) {
                return false;
            }
        }
        return true;
    }
}
