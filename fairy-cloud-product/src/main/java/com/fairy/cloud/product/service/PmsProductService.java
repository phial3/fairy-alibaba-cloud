package com.fairy.cloud.product.service;


import com.fairy.cloud.product.model.*;

import java.util.List;


public interface PmsProductService {

    /**
     * 获取商品详情信息
     *
     * @param id 商品id
     * @author 鹿少年
     * @date 10:43 2022/5/5
     **/
    PmsProductParam getProductInfo(Long id);


    /**
     * 获取秒杀商品
     * @param pageSize 页大小
     * @param pageNum 页号
     * @param flashPromotionId 秒杀活动ID，关联秒杀活动设置
     * @param sessionId 场次活动ID，for example：13:00-14:00场等
     * @return List
     */
    List<FlashPromotionProduct> getFlashProductList(Integer pageSize, Integer pageNum, Long flashPromotionId, Long sessionId);

    /**
     * 获取当前日期秒杀活动所有场次for example：13:00-14:00场等
     */
    List<FlashPromotionSessionExt> getFlashPromotionSessionList();

    /**
     * 获取首页秒杀商品
     * @return List
     */
    List<FlashPromotionProduct> getHomeSecKillProductList();


    /**
     * 查找出所有的产品ID
     *
     * @return List
     */
    List<Long> getAllProductId();
}
