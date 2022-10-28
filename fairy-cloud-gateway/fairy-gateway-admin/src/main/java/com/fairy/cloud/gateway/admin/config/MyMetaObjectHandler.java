package com.fairy.cloud.gateway.admin.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.fairy.common.entity.po.BasePo;
import com.fairy.common.util.UserContextHolder;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.ZonedDateTime;
import java.util.Date;

@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    /**
     * 获取当前交易的用户，为空返回默认system
     *
     * @return
     */
    private String getCurrentUsername() {
        return StringUtils.defaultIfBlank(UserContextHolder.getInstance().getUsername(), BasePo.DEFAULT_USERNAME);
    }

    @Override
    public void insertFill(MetaObject metaObject) {
        this.setInsertFieldValByName("createdBy", getCurrentUsername(), metaObject);
        this.setInsertFieldValByName("createdTime", Date.from(ZonedDateTime.now().toInstant()), metaObject);
        this.updateFill(metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setUpdateFieldValByName("updatedBy", getCurrentUsername(), metaObject);
        this.setUpdateFieldValByName("updatedTime", Date.from(ZonedDateTime.now().toInstant()), metaObject);
    }
}