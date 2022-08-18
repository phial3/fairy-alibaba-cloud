package com.fairy.cloud.api.feign;

import com.fairy.cloud.api.feign.config.FeignConfig;
import com.fairy.cloud.mbg.model.dto.OmsOrderParamDTO;
import com.fairy.cloud.mbg.model.pojo.OmsOrderPO;
import com.fairy.common.response.CommonResponse;
import feign.Body;
import feign.Headers;
import feign.Param;
import feign.RequestLine;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

///**
// * 新增订单
// *
// * @author 鹿少年
// * @date 2022/8/3 17:48
// */
@FeignClient(value = "fairy-cloud-order", path = "/order", configuration = FeignConfig.class)
public interface OrderFeign {
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    CommonResponse<OmsOrderPO> createOrder(@RequestBody OmsOrderParamDTO omsOrderItemPO);

//    @Headers({"Content-Type: application/json", "Accept: application/json"})
//    @RequestLine("PUT /create")
//    @Body("{omsOrderItemPO}")
//    CommonResponse<OmsOrderPO> createOrder(@Param("omsOrderItemPO") OmsOrderParamDTO omsOrderItemPO);
}
