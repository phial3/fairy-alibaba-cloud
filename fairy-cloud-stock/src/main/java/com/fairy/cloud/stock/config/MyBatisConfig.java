package com.fairy.cloud.stock.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * MyBatis配置类
 */
@Configuration
@EnableTransactionManagement
@MapperScan({"com.fairy.cloud.mbg.mapper","com.fairy.cloud.stock.dao"})
public class MyBatisConfig {


}
