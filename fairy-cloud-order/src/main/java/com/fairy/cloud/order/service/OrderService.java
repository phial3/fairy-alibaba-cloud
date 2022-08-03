package com.fairy.cloud.order.service;

import com.fairy.cloud.mbg.model.pojo.OmsOrderPO;
import com.fairy.cloud.order.model.dto.OmsOrderParamDTO;

/**
 * @author 鹿少年
 * @date 2022/8/3 18:12
 */
public interface OrderService {
    OmsOrderPO createOrder(OmsOrderParamDTO orderParam);
}
