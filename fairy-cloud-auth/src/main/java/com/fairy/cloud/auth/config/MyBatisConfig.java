package com.fairy.cloud.auth.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;


/**
 * Mybatis配置
 * @author 鹿少年
 * @version 1.0
 * @date 2022/4/30 21:28
 */
@Configuration
@EnableTransactionManagement
@MapperScan({"com.fairy.cloud.auth.mapper","com.fairy.cloud.mbg.mapper"})
public class MyBatisConfig {
}
