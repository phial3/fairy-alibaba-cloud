package com.fairy.cloud.product.service.impl;

import com.fairy.cloud.mbg.mapper.PmsProductMapper;
import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.cloud.product.cache.LocalCache;
import com.fairy.cloud.product.service.PmsProductService;
import com.fairy.cloud.product.zk.ZKLock;
import com.fairy.common.constants.RedisKeyPrefixConst;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.concurrent.TimeUnit;

@Transactional
@Slf4j
@Service
public class PmsProductServiceImpl implements PmsProductService {

    @Autowired
    private PmsProductMapper pmsProductMapper;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private RedissonClient redissonClient;


    @Autowired
    private LocalCache cache;

    /*
     * zk分布式锁
     */
    @Autowired
    private ZKLock zkLock;
    private String lockPath = "/load_db";


    /**
     * 获取商品详情信息
     *
     * @param id 产品ID
     */
    @Override
    public PmsProductPO getProductInfo(Long id) {
        return getProductInfoRedis(id);
    }

    /**
     * 获取商品详情信息  加入redis
     * 数据缓存存在数据不一致型
     *
     * @param id 产品ID
     */
    private PmsProductPO getProductInfoRedis(Long id) {
        //从jvm 本地缓存读取
        PmsProductPO productInfo = null;
        //redis 读数据
        Object value = redisTemplate.opsForValue().get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
        if (null != value) {
            productInfo = (PmsProductPO) value;
            return productInfo;
        }
        //redis加锁的方式
        RLock lock = redissonClient.getLock(lockPath + id);
        try {
            boolean rs = lock.tryLock(10, TimeUnit.SECONDS);
            if (rs) {
                productInfo = pmsProductMapper.selectById(id);
                if (null == productInfo) {
                    log.error("数据库没有查询到商品信息,id:" + id);
                    return null;
                }
                /*缓存设置失效时间 写入redis缓存数据*/
                redisTemplate.opsForValue().set(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo, 3600, TimeUnit.SECONDS);
            } else {
//                //没有那到锁也没有走数据库查询 这样肯定是本身有数据但是拿不到  就算走缓存，但是缓存没有数据
//                Thread.sleep(5 * 1000);
//                //自旋
//                getProductInfo(id);
                value = redisTemplate.opsForValue().get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
                if (null != value) {
                    productInfo = (PmsProductPO) value;
                }
            }
        } catch (Exception e) {
            log.error("异常信息:{}", e.getMessage());
        } finally {
            if (lock.isHeldByCurrentThread() && lock.isLocked()) {
                lock.unlock();
            }
        }

        return productInfo;
    }

    /**
     * 获取商品详情信息 分布式锁、 本地缓存、redis缓存 使用zk锁
     *
     * @param id 产品ID
     */
    private PmsProductPO getProductInfoZk(Long id) {
        PmsProductPO productInfo = null;
        //使用一级本地缓存 jvm
        productInfo = cache.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
        if (null != productInfo) {
            log.info("get jvm cache productInfo:" + productInfo);
            return productInfo;
        }
        //二级缓存 redis存储
        Object value = redisTemplate.opsForValue().get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
        if (value != null) {
            productInfo = (PmsProductPO) value;
            log.info("get redis productInfo:" + productInfo);
            cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);
            return productInfo;
        }
        try {
            //分布式锁
            if (zkLock.lock(lockPath + "_" + id)) {
                productInfo = pmsProductMapper.selectById(id);
                if (null == productInfo) {
                    log.error("数据库没有查询到商品信息");
                    return null;
                }
                log.info("set db productInfo:" + productInfo);
                //一级 二级缓存设置
                redisTemplate.opsForValue().set(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo, 3600, TimeUnit.SECONDS);
                cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);
            } else {
                log.info(Thread.currentThread().getName() + "没有获取到锁");
                value = redisTemplate.opsForValue().get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
                if (value != null) {
                    //redis 存在数据 写入到jvm Cache
                    productInfo = (PmsProductPO) value;
                    cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);
                }
            }
        } finally {
            log.info("unlock :" + productInfo);
            zkLock.unlock(lockPath + "_" + id);
        }
        return productInfo;
    }


    @Override
    public List<Integer> getAllProductId() {
        return pmsProductMapper.getAllProductId();
    }
}
