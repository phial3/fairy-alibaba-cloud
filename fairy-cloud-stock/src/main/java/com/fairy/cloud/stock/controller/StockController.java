package com.fairy.cloud.stock.controller;

import com.fairy.cloud.mbg.model.pojo.PmsStockPO;
import com.fairy.cloud.stock.service.StockService;
import com.fairy.common.response.CommonResponse;
import org.apache.skywalking.apm.toolkit.trace.Tag;
import org.apache.skywalking.apm.toolkit.trace.Tags;
import org.apache.skywalking.apm.toolkit.trace.Trace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    /*  @Trace
      @Tags({@Tag(key = "param", value = "arg[0]"), @Tag(key = "commonResponse", value = "returnedObj")})
      @GetMapping("/deduce/{productId}")
      public CommonResponse deduceStock(@PathVariable("productId") Integer productId, HttpServletRequest request) {
          PmsStockPO stockPO = stockService.deduceStock(productId);
          return CommonResponse.success(stockPO);

      }*/
    @Trace
    @Tags({@Tag(key = "param", value = "arg[0]"), @Tag(key = "commonResponse", value = "returnedObj")})
    @GetMapping("/deduce")
    public CommonResponse deduceStock(@RequestParam("productId") Integer productId, HttpServletRequest request) {
        PmsStockPO stockPO = stockService.deduceStock(productId);
        return CommonResponse.success(stockPO);

    }

    @GetMapping("/test")
    public CommonResponse test() {
        return CommonResponse.success();
    }
}
