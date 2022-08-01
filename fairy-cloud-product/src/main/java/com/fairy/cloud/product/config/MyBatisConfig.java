package com.fairy.cloud.product.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * MyBatis配置类
 */
@Configuration
@EnableTransactionManagement
@MapperScan({"com.fairy.cloud.mbg.mapper","com.fairy.cloud.product.dao"})
public class MyBatisConfig {


}
