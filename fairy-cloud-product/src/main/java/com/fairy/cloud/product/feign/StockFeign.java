package com.fairy.cloud.product.feign;

import com.fairy.cloud.mbg.model.pojo.OmsOrderPO;
import com.fairy.cloud.mbg.model.pojo.PmsStockPO;
import com.fairy.common.response.CommonResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 剩余库存
 * @author 鹿少年
 * @date 2022/8/3 17:54
 */
@FeignClient(value = "fairy-cloud-stock",path = "/stock")
public interface StockFeign {

    @RequestMapping(value = "/deduce", method = RequestMethod.GET)
    @ResponseBody
    CommonResponse<PmsStockPO> deduceStock(Integer productId);
}
