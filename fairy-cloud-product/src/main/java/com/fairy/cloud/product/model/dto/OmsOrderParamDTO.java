package com.fairy.cloud.product.model.dto;

import com.fairy.cloud.mbg.model.pojo.OmsOrderItemPO;

/**
 * @author 鹿少年
 * @date 2022/8/3 21:33
 */

public class OmsOrderParamDTO  extends OmsOrderItemPO {
    private String userName;
    private Integer memeberId;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getMemeberId() {
        return memeberId;
    }

    public void setMemeberId(Integer memeberId) {
        this.memeberId = memeberId;
    }
}
