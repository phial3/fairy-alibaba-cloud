package com.fairy.cloud.product.constant;

/**
 * @author 鹿少年
 * @date 2022/8/3 19:41
 */
public class Constants {
    public static String getOrderSn(Integer productId, Integer userId) {
        return String.valueOf(System.currentTimeMillis()+userId+productId);
    }
}
