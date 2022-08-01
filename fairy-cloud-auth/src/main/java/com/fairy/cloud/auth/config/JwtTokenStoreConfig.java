package com.fairy.cloud.auth.config;

import com.fairy.cloud.auth.enhance.JwtTokenEnhancer;
import com.fairy.cloud.auth.properties.JwtCAProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.oauth2.provider.endpoint.TokenKeyEndpoint;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;
import org.springframework.security.rsa.crypto.KeyStoreKeyFactory;

import java.security.KeyPair;

/**
 * jwt 存储 token
 *
 * @author 鹿少年
 * @date 2022/7/28 15:13
 */
@Configuration
@EnableConfigurationProperties(JwtCAProperties.class)
public class JwtTokenStoreConfig {

    @Autowired
    private JwtCAProperties jwtCAProperties;

    @Bean
    public TokenStore jwtTokenStore() {
        return new JwtTokenStore(jwtAccessTokenConverter());
    }

    @Bean
    public JwtAccessTokenConverter jwtAccessTokenConverter() {
        JwtAccessTokenConverter converter = new JwtAccessTokenConverter();
        //配置JWT使用的秘钥
        converter.setKeyPair(keyPair());
        return converter;
    }



    @Bean
    public KeyPair keyPair() {
        KeyStoreKeyFactory keyStoreKeyFactory = new KeyStoreKeyFactory(new ClassPathResource(jwtCAProperties.getKeyPairName()), jwtCAProperties.getKeyPairSecret().toCharArray());
        return keyStoreKeyFactory.getKeyPair(jwtCAProperties.getKeyPairAlias(), jwtCAProperties.getKeyPairStoreSecret().toCharArray());
    }

    @Bean
    public JwtTokenEnhancer jwtTokenEnhancer() {
        return new JwtTokenEnhancer();
    }

    /**
     * /oauth/token_key 去认证服务获取token_key出错
     * 需要配置
     * @return
     */
  /*  @Bean
    @ConditionalOnBean
    public TokenKeyEndpoint tokenKeyEndpoint() {
        return new TokenKeyEndpoint(jwtAccessTokenConverter());
    }*/
}
