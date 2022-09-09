package com.fairy.cloud.search.config;

import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.client.ClientConfiguration;
import org.springframework.data.elasticsearch.client.RestClients;
import org.springframework.data.elasticsearch.config.AbstractElasticsearchConfiguration;

/**
 * ElasticSearch 配置类
 * @author 鹿少年
 * @date 2022/9/9 19:29
 */
@Configuration
public class ElasticConfig extends AbstractElasticsearchConfiguration {

    @Value("${elastic.host}")
    private String host;
    @Value("${elastic.port}")
    private Integer port;

    @Bean
    @Override
    public RestHighLevelClient elasticsearchClient() {
        final ClientConfiguration clientConfiguration = ClientConfiguration.builder()
                .connectedTo(host+":"+port)
                .build();
        return RestClients.create(clientConfiguration).rest();
    }
}

