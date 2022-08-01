package com.fairy.cloud.product.service.impl;

import com.fairy.cloud.mbg.mapper.SmsFlashPromotionMapper;
import com.fairy.cloud.mbg.mapper.SmsFlashPromotionSessionMapper;
import com.fairy.cloud.mbg.model.SmsFlashPromotion;
import com.fairy.cloud.mbg.model.SmsFlashPromotionExample;
import com.fairy.cloud.mbg.model.SmsFlashPromotionSession;
import com.fairy.cloud.product.cache.LocalCache;
import com.fairy.cloud.product.dao.FlashPromotionProductDao;
import com.fairy.cloud.product.dao.PortalProductDao;
import com.fairy.cloud.product.model.FlashPromotionParam;
import com.fairy.cloud.product.model.FlashPromotionProduct;
import com.fairy.cloud.product.model.FlashPromotionSessionExt;
import com.fairy.cloud.product.model.PmsProductParam;
import com.fairy.cloud.product.service.PmsProductService;
import com.fairy.cloud.product.zk.ZKLock;
import com.fairy.common.constants.RedisKeyPrefixConst;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Transactional
@Slf4j
@Service
public class PmsProductServiceImpl implements PmsProductService {

    @Autowired
    private PortalProductDao portalProductDao;
    @Autowired
    private FlashPromotionProductDao flashPromotionProductDao;
    @Autowired
    private SmsFlashPromotionMapper flashPromotionMapper;
    @Autowired
    private SmsFlashPromotionSessionMapper promotionSessionMapper;
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
    public PmsProductParam getProductInfo(Long id) {
        return getProductInfoRedis(id);
    }

    /**
     * 获取商品详情信息  加入redis
     * 数据缓存存在数据不一致型
     *
     * @param id 产品ID
     */
    private PmsProductParam getProductInfoRedis(Long id) {
        //从jvm 本地缓存读取
        PmsProductParam productInfo = null;
        //redis 读数据
        Object value = redisTemplate.opsForValue().get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
        if (null != value) {
            productInfo = (PmsProductParam) value;
            return productInfo;
        }
        //redis加锁的方式
        RLock lock = redissonClient.getLock(lockPath + id);
        try {
            boolean rs = lock.tryLock(10, TimeUnit.SECONDS);
            if (rs) {
                productInfo = portalProductDao.getProductInfo(id);
                if (null == productInfo) {
                    log.error("数据库没有查询到商品信息,id:" + id);
                    return null;
                }
                gainProductInfo(id, productInfo);
                /*缓存设置失效时间 写入redis缓存数据*/
                redisTemplate.opsForValue().set(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo, 3600, TimeUnit.SECONDS);
            } else {
//                //没有那到锁也没有走数据库查询 这样肯定是本身有数据但是拿不到  就算走缓存，但是缓存没有数据
//                Thread.sleep(5 * 1000);
//                //自旋
//                getProductInfo(id);
                value = redisTemplate.opsForValue().get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
                if (null != value) {
                    productInfo = (PmsProductParam) value;
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
    private PmsProductParam getProductInfoZk(Long id) {
        PmsProductParam productInfo;
        //使用一级本地缓存 jvm
        productInfo = cache.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
        if (null != productInfo) {
            log.info("get jvm cache productInfo:" + productInfo);
            return productInfo;
        }
        //二级缓存 redis存储
        Object value = redisTemplate.opsForValue().get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
        if (value != null) {
            productInfo = (PmsProductParam) value;
            log.info("get redis productInfo:" + productInfo);
            cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);
            return productInfo;
        }
        try {
            //分布式锁
            if (zkLock.lock(lockPath + "_" + id)) {
                productInfo = portalProductDao.getProductInfo(id);
                if (null == productInfo) {
                    log.error("数据库没有查询到商品信息");
                    return null;
                }
                gainProductInfo(id, productInfo);
                log.info("set db productInfo:" + productInfo);
                //一级 二级缓存设置
                redisTemplate.opsForValue().set(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo, 3600, TimeUnit.SECONDS);
                cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);
            } else {
                log.info(Thread.currentThread().getName() + "没有获取到锁");
                value = redisTemplate.opsForValue().get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
                if (value != null) {
                    //redis 存在数据 写入到jvm Cache
                    productInfo = (PmsProductParam) value;
                    cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);
                }
            }
        } finally {
            log.info("unlock :" + productInfo);
            zkLock.unlock(lockPath + "_" + id);
        }
        return productInfo;
    }

    /**
     * 查找所有的秒杀活动商品
     *
     * @param id          商品id
     * @param productInfo 商品信息
     */
    private void gainProductInfo(Long id, PmsProductParam productInfo) {
        //查找所有的秒杀活动商品
        FlashPromotionParam promotion = flashPromotionProductDao.getFlashPromotion(id);
        if (!ObjectUtils.isEmpty(promotion)) {
            productInfo.setFlashPromotionCount(promotion.getRelation().get(0).getFlashPromotionCount());
            productInfo.setFlashPromotionLimit(promotion.getRelation().get(0).getFlashPromotionLimit());
            productInfo.setFlashPromotionPrice(promotion.getRelation().get(0).getFlashPromotionPrice());
            productInfo.setFlashPromotionRelationId(promotion.getRelation().get(0).getId());
            productInfo.setFlashPromotionEndDate(promotion.getEndDate());
            productInfo.setFlashPromotionStartDate(promotion.getStartDate());
            productInfo.setFlashPromotionStatus(promotion.getStatus());
        }
    }


    @Override
    public List<FlashPromotionProduct> getFlashProductList(Integer pageSize, Integer pageNum, Long flashPromotionId, Long sessionId) {
        PageHelper.startPage(pageNum, pageSize, "sort desc");
        return flashPromotionProductDao.getFlashProductList(flashPromotionId, sessionId);
    }


    @Override
    public List<FlashPromotionSessionExt> getFlashPromotionSessionList() {
        Date now = new Date();
        SmsFlashPromotion promotion = getFlashPromotion(now);
        if (promotion != null) {
            List<SmsFlashPromotionSession> promotionSessionList = promotionSessionMapper.getFlashPromotionSessionList();
            List<FlashPromotionSessionExt> extList = new ArrayList<>();
            if (!CollectionUtils.isEmpty(promotionSessionList)) {
                promotionSessionList.stream().forEach((item) -> {
                    FlashPromotionSessionExt ext = new FlashPromotionSessionExt();
                    BeanUtils.copyProperties(item, ext);
                    ext.setFlashPromotionId(promotion.getId());
                    if (now.after(ext.getStartTime()) && now.before(ext.getEndTime())) {
                        //活动进行中
                        ext.setSessionStatus(0);
                    } else if (now.before(ext.getStartTime())) {
                        //活动即将开始
                        ext.setSessionStatus(1);
                    } else if (now.after(ext.getEndTime())) {
                        //活动已结束
                        ext.setSessionStatus(2);
                    }
                    extList.add(ext);
                });
                return extList;
            }
        }
        return null;
    }


    private SmsFlashPromotion getFlashPromotion(Date date) {
        SmsFlashPromotionExample example = new SmsFlashPromotionExample();
        example.createCriteria()
                .andStatusEqualTo(1)
                .andStartDateLessThanOrEqualTo(date)
                .andEndDateGreaterThanOrEqualTo(date);
        List<SmsFlashPromotion> flashPromotionList = flashPromotionMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(flashPromotionList)) {
            return flashPromotionList.get(0);
        }
        return null;
    }


    @Override
    public List<FlashPromotionProduct> getHomeSecKillProductList() {
        PageHelper.startPage(1, 8, "sort desc");
        FlashPromotionParam flashPromotionParam = flashPromotionProductDao.getFlashPromotion(null);
        if (flashPromotionParam == null || CollectionUtils.isEmpty(flashPromotionParam.getRelation())) {
            return null;
        }
        List<Long> promotionIds = new ArrayList<>();
        flashPromotionParam.getRelation().stream().forEach(item -> {
            promotionIds.add(item.getId());
        });
        PageHelper.clearPage();
        return flashPromotionProductDao.getHomePromotionProductList(promotionIds);
    }



    @Override
    public List<Long> getAllProductId() {
        return portalProductDao.getAllProductId();
    }
}
