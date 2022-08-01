package com.fairy.cloud.auth.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPublicKey;
import java.util.HashMap;
import java.util.Map;

/**
 * 获取RSA公钥接口
 *
 * @author 鹿少年
 * @version 1.0
 * @date 2022/5/4 17:52
 */
@Slf4j
@RestController
@RequestMapping("")
public class KeyPairController {

    @Autowired
    private KeyPair keyPair;

    @GetMapping("/rsa/publicKey")
    @ResponseBody
    public Map<String, String> getKey() throws Exception {
        //将公私钥对象存入map中,PUBLIC_KEY和PRIVATE_KEY为你自动生成的公私钥
        PublicKey rsaPublicKey = keyPair.getPublic();
        PrivateKey rsaPrivateKey = keyPair.getPrivate();

        Map<String, String> keyMap = new HashMap<>(2);
        keyMap.put("public", getPublicKey(rsaPublicKey));
        keyMap.put("private", getPrivateKey(rsaPrivateKey));
        return keyMap;
    }

    private String getPublicKey(PublicKey rsaPublicKey) {
        return Base64.encodeBase64String(rsaPublicKey.getEncoded());
    }


    /**
     * 将原始私钥进行处理，获取规范私钥
     *
     * @return 返回规范私钥
     * @throws Exception
     */
    public String getPrivateKey(PrivateKey privateKey) throws Exception {
        return Base64.encodeBase64String(privateKey.getEncoded());
    }
}
