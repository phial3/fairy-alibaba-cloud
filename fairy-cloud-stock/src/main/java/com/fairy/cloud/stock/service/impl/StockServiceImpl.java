package com.fairy.cloud.stock.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fairy.cloud.mbg.mapper.PmsStockMapper;
import com.fairy.cloud.mbg.model.pojo.PmsStockPO;
import com.fairy.cloud.stock.service.StockService;
import com.fairy.common.enums.ServiceErrorEnum;
import com.fairy.common.error.ServiceException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 鹿少年
 * @date 2022/8/3 18:06
 */
@Slf4j
@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private PmsStockMapper pmsStockMapper;

    @Override
    public PmsStockPO deduceStock(Integer productId) {
        QueryWrapper<PmsStockPO> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PmsStockPO::getProductId, productId);
        PmsStockPO pmsStockPO = pmsStockMapper.selectOne(wrapper);
        if (pmsStockPO.getStock() <= 0) {
            throw new ServiceException(ServiceErrorEnum.SERVICE_ERROR,"商品库存不足");
        }
        pmsStockPO.setStock(pmsStockPO.getStock()-1);

        pmsStockMapper.updateById(pmsStockPO);
        return pmsStockPO;
    }
}
