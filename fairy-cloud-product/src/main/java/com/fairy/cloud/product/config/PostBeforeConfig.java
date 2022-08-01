package com.fairy.cloud.product.config;

import com.fairy.cloud.product.dao.FlashPromotionProductDao;
import com.fairy.cloud.product.model.FlashPromotionParam;
import com.fairy.common.constants.RedisKeyPrefixConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;

import javax.annotation.PostConstruct;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * @author 鹿少年
 * @date 2022/8/1 15:23
 */
@Configuration
public class PostBeforeConfig {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private FlashPromotionProductDao flashPromotionProductDao;

    /**
     * 加载所有的秒杀活动商品库存到缓存redis中
     *
     * @throws Exception
     */
    @PostConstruct
    public void afterPropertiesSet() {
        //todo  获取所有的秒杀活动中商品
        FlashPromotionParam promotion = flashPromotionProductDao.getFlashPromotion(null);
        //TODO 如果没有秒杀活动 后面会报错
        if (null == promotion) {
            return;
        }
        Date now = new Date();
        Date endDate = promotion.getEndDate();//结束时间
        final Long expired = endDate.getTime() - now.getTime();//剩余时间
        //秒杀商品库存缓存到redis
        promotion.getRelation().stream().forEach((item) -> {
            redisTemplate.opsForValue().setIfAbsent(
                    RedisKeyPrefixConst.MIAOSHA_STOCK_CACHE_PREFIX + item.getProductId()
                    , item.getFlashPromotionCount()
                    , expired
                    , TimeUnit.MILLISECONDS);
        });
    }
}
