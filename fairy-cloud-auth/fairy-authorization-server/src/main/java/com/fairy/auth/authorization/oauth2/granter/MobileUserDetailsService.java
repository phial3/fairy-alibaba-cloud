//package com.fairy.auth.authorization.oauth2.granter;
//
//import com.fairy.auth.authorization.oauth2.provider.SmsCodeProvider;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.stereotype.Service;
//
///**
// * 手机验证码登陆, 用户相关获取
// * @author 鹿少年
// * @date 2022/10/13 20:32
// */
//@Slf4j
//@Service("mobileUserDetailsService")
//public class MobileUserDetailsService extends CustomUserDetailsService {
//
////    @Autowired
////    private SmsCodeProvider smsCodeProvider;
//
//    @Override
//    public UserDetails loadUserByUsername(String uniqueId) {
//
//        User user = userService.getByUniqueId(uniqueId);
//        log.info("load user by mobile:{}", user.toString());
//
//        // 如果为mobile模式，从短信服务中获取验证码（动态密码）
//        String credentials = smsCodeProvider.getSmsCode(uniqueId, "LOGIN");
//
//        return new org.springframework.security.core.userdetails.User(
//                user.getUsername(),
//                credentials,
//                user.getEnabled(),
//                user.getAccountNonExpired(),
//                user.getCredentialsNonExpired(),
//                user.getAccountNonLocked(),
//                super.obtainGrantedAuthorities(user));
//    }
//}
//
