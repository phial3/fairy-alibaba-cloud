package com.fairy.cloud.gateway.utils;

import com.fairy.common.enums.ResultEnums;
import com.fairy.common.exception.GateWayException;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwsHeader;
import io.jsonwebtoken.Jwt;
import io.jsonwebtoken.Jwts;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.Map;

/**
 * 通过keyPair 接口获取公钥和私钥
 */
@Slf4j
@Component
public class KeyPairUtil {

    /**
     * 认证服务器许可我们的网关的clientId(需要在oauth_client_details表中配置)
     */
    @Value("${auth.clientId}")
    private String CLIENT_ID;
    /**
     * 认证服务器许可我们的网关的client_secret(需要在oauth_client_details表中配置)
     */
    @Value("${auth.clientSecret}")
    private String CLIENT_SECRET ;
    /**
     * 认证服务器暴露的获取token_key的地址
     */
    @Value("${auth.tokenUrl}")
    private String AUTH_TOKEN_KEY_URL;

    /**
     * 请求头中的 token的开始
     */
    @Value("${auth.authHeader}")
    private String AUTH_HEADER ;


    /**
     * 方法实现说明: 通过远程调用获取认证服务器颁发jwt的解析的key
     *
     * @param restTemplate 远程调用的操作类
     * @return: tokenKey 解析jwt的tokenKey
     */
    private String getTokenKeyByRemoteCall(RestTemplate restTemplate) throws GateWayException {
        //第一步:封装请求头
        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(null, null);
        //第二步:远程调用获取token_key
        try {
            ResponseEntity<Map> response = restTemplate.exchange(AUTH_TOKEN_KEY_URL, HttpMethod.GET, entity, Map.class);
            String pulicKey = response.getBody().get("public").toString();
            String privateKey = response.getBody().get("private").toString();
            log.info("去认证服务器获取公钥:[{}],私钥:[{}]", pulicKey ,privateKey);
            return pulicKey;
        } catch (Exception e) {
            log.error("远程调用认证服务器获取Token_Key失败:{}", e.getMessage());
            throw new GateWayException(ResultEnums.GET_TOKEN_KEY_ERROR);
        }
    }

    /**
     * 方法实现说明:生成公钥
     *
     * @param restTemplate:远程调用操作类
     * @return: PublicKey 公钥对象
     */
    public PublicKey genPulicKey(RestTemplate restTemplate) throws GateWayException {
        String tokenKey = getTokenKeyByRemoteCall(restTemplate);
        try {
            //把获取的公钥开头和结尾替换掉
            java.security.Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
            X509EncodedKeySpec pubKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(tokenKey));
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            PublicKey publicKey = keyFactory.generatePublic(pubKeySpec);
            log.info("生成公钥:{}", publicKey);
            return publicKey;
        } catch (Exception e) {
            log.info("生成公钥异常:{}", e.getMessage());
            throw new GateWayException(ResultEnums.GEN_PUBLIC_KEY_ERROR);
        }
    }

    public Claims validateJwtToken(String authHeader, PublicKey publicKey) {
        String token = null;
        try {
            token = StringUtils.substringAfter(authHeader, AUTH_HEADER+" ");
            Jwt<JwsHeader, Claims> parseClaimsJwt = Jwts.parser().setSigningKey(publicKey).parseClaimsJws(token);
            Claims claims = parseClaimsJwt.getBody();
            return claims;
        } catch (Exception e) {
            log.error("校验token异常:{},异常信息:{}", token, e.getMessage());
            throw new GateWayException(ResultEnums.JWT_TOKEN_EXPIRE);
        }
    }
}