package com.fairy.cloud.product.service;


import com.fairy.cloud.mbg.model.pojo.PmsProductPO;

import java.util.List;


public interface PmsProductService {

    /**
     * 获取商品详情信息
     *
     * @param id 商品id
     * @author 鹿少年
     * @date 10:43 2022/5/5
     **/
    PmsProductPO getProductInfo(Long id);


    /**
     * 查找出所有的产品ID
     *
     * @return List
     */
    List<Integer> getAllProductId();
}
