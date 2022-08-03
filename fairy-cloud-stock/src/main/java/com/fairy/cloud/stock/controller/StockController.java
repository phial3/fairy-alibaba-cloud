package com.fairy.cloud.stock.controller;

import com.fairy.cloud.mbg.model.pojo.PmsStockPO;
import com.fairy.cloud.stock.service.StockService;
import com.fairy.common.response.CommonResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 鹿少年
 * @date 2022/8/3 18:04
 */
@RestController
public class StockController {


    @Autowired
    private StockService stockService;

    @GetMapping("/deduce")
    public CommonResponse deduceStock(HttpServletRequest request, Integer productId ) {
      PmsStockPO stockPO= stockService.deduceStock(productId);
      return CommonResponse.success(stockPO);

    }
}
