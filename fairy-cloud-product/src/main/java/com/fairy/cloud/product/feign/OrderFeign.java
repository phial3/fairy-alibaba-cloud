package com.fairy.cloud.product.feign;

import com.fairy.cloud.mbg.model.pojo.OmsOrderItemPO;
import com.fairy.cloud.mbg.model.pojo.OmsOrderPO;
import com.fairy.common.response.CommonResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 新增订单
 *
 * @author 鹿少年
 * @date 2022/8/3 17:48
 */
@FeignClient(value = "fairy-cloud-order", path = "/order")
public interface OrderFeign {
    @RequestMapping(value = "/create", method = RequestMethod.PUT)
    @ResponseBody
    CommonResponse<OmsOrderPO> createOrder(OmsOrderItemPO omsOrderItemPO);
}
