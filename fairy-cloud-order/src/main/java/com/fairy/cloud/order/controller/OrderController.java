package com.fairy.cloud.order.controller;

import com.fairy.cloud.mbg.model.pojo.OmsOrderItemPO;
import com.fairy.cloud.mbg.model.pojo.OmsOrderPO;
import com.fairy.cloud.order.service.OrderService;
import com.fairy.common.response.CommonResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 鹿少年
 * @date 2022/8/3 18:02
 */
@RestController
public class OrderController {

    @Autowired
    private OrderService orderService;


    @PutMapping("/create")
    public CommonResponse createOrder(@RequestBody OmsOrderItemPO orderParam) {
        OmsOrderPO omsOrderPO = orderService.createOrder(orderParam);
        return CommonResponse.success(omsOrderPO);
    }
}
