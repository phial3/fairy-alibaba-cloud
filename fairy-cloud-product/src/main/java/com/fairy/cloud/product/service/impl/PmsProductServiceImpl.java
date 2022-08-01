package com.fairy.cloud.product.service.impl;

import com.fairy.cloud.mbg.mapper.SmsFlashPromotionMapper;
import com.fairy.cloud.mbg.mapper.SmsFlashPromotionSessionMapper;
import com.fairy.cloud.mbg.model.SmsFlashPromotion;
import com.fairy.cloud.mbg.model.SmsFlashPromotionExample;
import com.fairy.cloud.mbg.model.SmsFlashPromotionSession;
import com.fairy.cloud.product.cache.LocalCache;
import com.fairy.cloud.product.component.zklock.ZKLock;
import com.fairy.cloud.product.dao.FlashPromotionProductDao;
import com.fairy.cloud.product.dao.PortalProductDao;
import com.fairy.cloud.product.model.*;
import com.fairy.cloud.product.service.PmsProductService;
import com.fairy.common.constants.RedisKeyPrefixConst;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
    private RedisOpsUtil redisOpsUtil;
    @Autowired
    private RedissonClient redissonClient;


    @Autowired
    private LocalCache cache;

//    private Map<String, PmsProductParam> cacheMap = new ConcurrentHashMap<>();

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
        return getProductInfo1(id);
    }

    /***
     * 直接访问数据库 获取商品详情信息
     * @param id 商品id
     * @return PmsProductParam
     */
    private PmsProductParam getProductInfo1(Long id) {
        PmsProductParam productInfo = portalProductDao.getProductInfo(id);
        if (null == productInfo) {
            return null;
        }
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
        return productInfo;
    }

    /**
     * 获取商品详情信息  加入redis
     * 数据缓存存在数据不一致型
     *
     * @param id 产品ID
     */
    public PmsProductParam getProductInfoRedis(Long id) {
        //从缓存Redis里找
        PmsProductParam productInfo = redisOpsUtil.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, PmsProductParam.class);
        if (null != productInfo) {
            return productInfo;
        }
        RLock lock = redissonClient.getLock(lockPath + id);
        try {
            boolean rs = lock.tryLock(10, TimeUnit.SECONDS);
            if (rs) {
                /*查找数据库*/
                productInfo = portalProductDao.getProductInfo(id);
                if (null == productInfo) {
                    log.warn("没有查询到商品信息,id:" + id);
                    return null;
                }
                checkFlash(id, productInfo);
                /*缓存设置失效时间*/
                redisOpsUtil.set(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo, 3600, TimeUnit.SECONDS);
            }/* else {
                //没有那到锁也没有走数据库查询 这样肯定是本身有数据但是拿不到  就算走缓存，但是缓存没有数据
                Thread.sleep(5 * 1000);
                //自旋
                getProductInfo(id);

            }*/
        } catch (Exception e) {
            log.error("异常信息:{}", e.getMessage());
        } finally {
            if (lock.isHeldByCurrentThread() && lock.isLocked()) {
                lock.unlock();
            }
        }

        return productInfo;
    }

    public PmsProductParam getProductInfo2(Long id) {
        //从缓存Redis里找
        PmsProductParam productInfo = redisOpsUtil.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, PmsProductParam.class);
        if (null != productInfo) {
            return productInfo;
        }
        /*查找数据库*/
        productInfo = portalProductDao.getProductInfo(id);
        if (null == productInfo) {
            log.warn("没有查询到商品信息,id:" + id);
            return null;
        }
        checkFlash(id, productInfo);
        /*缓存设置失效时间*/
        redisOpsUtil.set(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo, 3600, TimeUnit.SECONDS);
        return productInfo;
    }

    /**
     * 获取商品详情信息 分布式锁、 本地缓存、redis缓存
     *
     * @param id 产品ID
     */
    public PmsProductParam getProductInfo3(Long id) {
        PmsProductParam productInfo = null;
        productInfo = cache.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
        if (null != productInfo) {
            return productInfo;
        }
        productInfo = redisOpsUtil.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, PmsProductParam.class);
        if (productInfo != null) {
            log.info("get redis productId:" + productInfo);
            cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);
            return productInfo;
        }
        try {
            if (zkLock.lock(lockPath + "_" + id)) {
                productInfo = portalProductDao.getProductInfo(id);
                if (null == productInfo) {
                    return null;
                }
                checkFlash(id, productInfo);
                log.info("set db productId:" + productInfo);
                redisOpsUtil.set(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo, 3600, TimeUnit.SECONDS);
                cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);
            } else {
                log.info("get redis2 productId:" + productInfo);
                productInfo = redisOpsUtil.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, PmsProductParam.class);
                if (productInfo != null) {
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
    private void checkFlash(Long id, PmsProductParam productInfo) {
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


    /**
     * add by yangguo
     * 获取秒杀商品列表
     *
     * @param flashPromotionId 秒杀活动ID，关联秒杀活动设置
     * @param sessionId        场次活动ID，for example：13:00-14:00场等
     */

    @Override
    public List<FlashPromotionProduct> getFlashProductList(Integer pageSize, Integer pageNum, Long flashPromotionId, Long sessionId) {
        PageHelper.startPage(pageNum, pageSize, "sort desc");
        return flashPromotionProductDao.getFlashProductList(flashPromotionId, sessionId);
    }

    /**
     * 获取当前日期秒杀活动所有场次
     *
     * @return
     */
    @Override
    public List<FlashPromotionSessionExt> getFlashPromotionSessionList() {
        Date now = new Date();
        SmsFlashPromotion promotion = getFlashPromotion(now);
        if (promotion != null) {
//            SmsFlashPromotionSessionExample sessionExample = new SmsFlashPromotionSessionExample();
//            //获取时间段内的秒杀场次 启用状态
//            sessionExample.createCriteria().andStatusEqualTo(1);
//            sessionExample.setOrderByClause("start_time asc");
//            List<SmsFlashPromotionSession> promotionSessionList = promotionSessionMapper.selectByExample(sessionExample);
            List<SmsFlashPromotionSession> promotionSessionList = promotionSessionMapper.getFlashPromotionSessionList();
            List<FlashPromotionSessionExt> extList = new ArrayList<>();
            if (!CollectionUtils.isEmpty(promotionSessionList)) {
                promotionSessionList.stream().forEach((item) -> {
                    FlashPromotionSessionExt ext = new FlashPromotionSessionExt();
                    BeanUtils.copyProperties(item, ext);
                    ext.setFlashPromotionId(promotion.getId());
                    if (DateUtil.getTime(now).after(DateUtil.getTime(ext.getStartTime()))
                            && DateUtil.getTime(now).before(DateUtil.getTime(ext.getEndTime()))) {
                        //活动进行中
                        ext.setSessionStatus(0);
                    } else if (DateUtil.getTime(now).after(DateUtil.getTime(ext.getEndTime()))) {
                        //活动即将开始
                        ext.setSessionStatus(1);
                    } else if (DateUtil.getTime(now).before(DateUtil.getTime(ext.getStartTime()))) {
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

    /**
     * 根据时间获取秒杀活动
     * @param date
     * @return
     */
    public SmsFlashPromotion getFlashPromotion(Date date) {
        Date currDate = DateUtil.getDate(date);
        SmsFlashPromotionExample example = new SmsFlashPromotionExample();
        example.createCriteria()
                .andStatusEqualTo(1)
                .andStartDateLessThanOrEqualTo(currDate)
                .andEndDateGreaterThanOrEqualTo(currDate);
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
    public CartProduct getCartProduct(Long productId) {
        return portalProductDao.getCartProduct(productId);
    }

    @Override
    public List<PromotionProduct> getPromotionProductList(List<Long> ids) {
        return portalProductDao.getPromotionProductList(ids);
    }


    @Override
    public List<Long> getAllProductId() {
        return portalProductDao.getAllProductId();
    }
}
