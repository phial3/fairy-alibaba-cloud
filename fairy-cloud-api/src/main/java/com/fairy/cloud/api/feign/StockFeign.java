package com.fairy.cloud.api.feign;

import com.fairy.cloud.api.feign.config.FeignConfig;
import com.fairy.cloud.mbg.model.pojo.PmsStockPO;
import com.fairy.common.response.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

///**
// * 剩余库存
// *
// * @author 鹿少年
// * @date 2022/8/3 17:54
// */
@FeignClient(value = "fairy-cloud-stock", path = "/stock", configuration = FeignConfig.class)
public interface StockFeign {

    @RequestMapping(value = "/deduce", method = RequestMethod.GET)
    @ResponseBody
    Result<PmsStockPO> deduceStock(@RequestParam("productId") Integer productId);


//    @RequestMapping(value = "/deduce/{productId}", method = RequestMethod.GET)
//    @ResponseBody
//    Result<PmsStockPO> deduceStock(@PathVariable("productId") Integer productId);

//     @RequestLine("GET /deduce}")
//     Result<PmsStockPO> deduceStock(@Param("productId") Integer productId);
}
