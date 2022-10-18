package com.fairy.auth.authorication.client.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author 鹿少年
 * @date 2022/10/13 23:54
 */
@Configuration
@EnableTransactionManagement
@MapperScan({"com.fairy.cloud.mbg.mapper"})
public class MyBatisConfig {
}
