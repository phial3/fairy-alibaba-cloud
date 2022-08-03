package com.fairy.cloud.order.service;

import com.fairy.cloud.mbg.model.pojo.OmsOrderItemPO;
import com.fairy.cloud.mbg.model.pojo.OmsOrderPO;

/**
 * @author 鹿少年
 * @date 2022/8/3 18:12
 */
public interface OrderService {
    OmsOrderPO createOrder(OmsOrderItemPO orderParam,String userName,Integer memberId);
}
