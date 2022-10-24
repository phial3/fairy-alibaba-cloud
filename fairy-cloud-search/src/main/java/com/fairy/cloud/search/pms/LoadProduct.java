package com.fairy.cloud.search.pms;

import com.fairy.cloud.search.service.EsProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Slf4j
@Component
public class LoadProduct implements InitializingBean {

    @Resource
    private EsProductService productService;

    /**
     * 讲数据库的商品数据加载到es中
     */
    @Override
    public void afterPropertiesSet() throws Exception{
        productService.loadAllProductToEs();
    }

}
