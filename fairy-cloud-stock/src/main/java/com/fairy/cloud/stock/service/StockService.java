package com.fairy.cloud.stock.service;

import com.fairy.cloud.mbg.model.pojo.PmsStockPO;

/**
 * @author 鹿少年
 * @date 2022/8/3 18:06
 */
public interface StockService {
    PmsStockPO deduceStock(Integer productId);
}
