package com.fairy.cloud.order.controller;

import com.fairy.cloud.mbg.model.dto.OmsOrderParamDTO;
import com.fairy.cloud.mbg.model.pojo.OmsOrderPO;
import com.fairy.cloud.order.service.OrderService;
import com.fairy.common.response.CommonResponse;
import org.apache.skywalking.apm.toolkit.trace.Tag;
import org.apache.skywalking.apm.toolkit.trace.Tags;
import org.apache.skywalking.apm.toolkit.trace.Trace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 鹿少年
 * @date 2022/8/3 18:02
 */
@RestController
public class OrderController {

    @Autowired
    private OrderService orderService;


    @Trace
    @Tags({@Tag(key = "param", value = "arg[0]"), @Tag(key = "commonResponse", value = "returnedObj")})
    @PostMapping("/create")
    public CommonResponse createOrder(@RequestBody OmsOrderParamDTO orderParam, HttpServletRequest request) {
        OmsOrderPO omsOrderPO = orderService.createOrder(orderParam);
        return CommonResponse.success(omsOrderPO);
    }
}
