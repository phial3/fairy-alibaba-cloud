package com.fairy.cloud.auth.enhance;

import com.fairy.cloud.auth.model.MemberDetails;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;

import java.util.HashMap;
import java.util.Map;

/**
 * jwt内容增强器可以新增其他内容
 * @author 鹿少年
 */
public class JwtTokenEnhancer implements TokenEnhancer {

    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
        MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();
        final Map<String, Object> additionalInfo = new HashMap<>();
        final Map<String, Object> retMap = new HashMap<>();
        //todo 这里暴露memberId到Jwt的令牌中,后期可以根据自己的业务需要 进行添加字段
        additionalInfo.put("memberId", memberDetails.getUmsMember().getId());
        additionalInfo.put("nickName", memberDetails.getUmsMember().getNickname());
        additionalInfo.put("integration", memberDetails.getUmsMember().getIntegration());
        retMap.put("additionalInfo", additionalInfo);
        ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(retMap);
        return accessToken;
    }
}