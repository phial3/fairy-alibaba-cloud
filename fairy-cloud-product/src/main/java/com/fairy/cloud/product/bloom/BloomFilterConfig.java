package com.fairy.cloud.product.bloom;

import com.fairy.cloud.product.service.PmsProductService;
import com.fairy.common.constants.RedisKeyPrefixConst;
import com.google.common.base.Charsets;
import com.google.common.hash.Funnel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.CollectionUtils;

import java.util.List;


@Slf4j
@Configuration
public class BloomFilterConfig implements InitializingBean{

    @Autowired
    private PmsProductService productService;

    @Autowired
    private RedisTemplate template;

    @Autowired
    private BloomRedisService bloomRedisService;

    @Bean
    public MyBloomFilter<String> myBloomFilter() {
        return new MyBloomFilter<>((Funnel<String>) (from, into) -> into.putString(from, Charsets.UTF_8)
                .putString(from, Charsets.UTF_8), 1000000, 0.01);
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        List<Long> list = productService.getAllProductId();
        log.info("加载产品到布隆过滤器当中,size:{}",list.size());
        if(!CollectionUtils.isEmpty(list)){
            list.stream().forEach(item->{
                bloomRedisService.addByBloomFilter(RedisKeyPrefixConst.PRODUCT_REDIS_BLOOM_FILTER,item);
            });
        }
    }
}
