package com.fairy.cloud.auth.utils;

import org.apache.commons.codec.binary.Base64;

import java.security.Key;
import java.util.Map;

/**
 * @author 鹿少年
 * @version 1.0
 * @date 2022/5/4 18:23
 */
public class PasswordUtils {

    /**
     * 使用公钥对原始数据进行加密
     * @param content 原始数据
     * @param public_key 公钥
     * @return 加密数据
     * @throws Exception
     */
/*
    private static String encrypt(String content,String public_key) throws Exception {
        //获取处理之后的规范公钥
        PublicKey publicKey = getPublicKey(public_key);
        //指定加密算法
        Cipher cipher= Cipher.getInstance(ALGORITHM_RSA);
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        byte[] result = cipher.doFinal(content.getBytes(CHARSET));
        return org.apache.commons.codec.binary.Base64.encodeBase64String(result);
    }
*/

    /**
     * 利用私钥对原始数据进行解密
     * @param content
     * @param private_key
     * @return
     * @throws Exception
     */
 /*   private static String decrypt(String content,String private_key) throws Exception {
        byte[] decodeContent = org.apache.commons.codec.binary.Base64.decodeBase64(content);
        //获取规范私钥
        PrivateKey privateKey = getPrivateKey(private_key);
        //指定解密算法
        Cipher cipher=Cipher.getInstance("rsa");
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] result = cipher.doFinal(decodeContent);
        return new String(result);
    }*/

    public static String getPublicKey(Map<String, Object> keyMap) throws Exception {
        Key key = (Key) keyMap.get("public");
        return Base64.encodeBase64String(key.getEncoded());
    }
    /**
     * 将原始私钥进行处理，获取规范私钥
     * @param keyMap
     * @return 返回规范私钥
     * @throws Exception
     */
    public static String getPrivateKey(Map<String, Object> keyMap) throws Exception {
        Key key = (Key) keyMap.get("private");
        return Base64.encodeBase64String(key.getEncoded());
    }
}
