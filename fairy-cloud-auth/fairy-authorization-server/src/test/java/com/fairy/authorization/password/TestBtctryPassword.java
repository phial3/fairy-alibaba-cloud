package com.fairy.authorization.password;

import com.fairy.auth.authorization.Oauth2AuthorizationApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * @author 鹿少年
 * @date 2022/10/16 18:41
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Oauth2AuthorizationApplication.class)
public class TestBtctryPassword {
    @Resource
    private PasswordEncoder passwordEncoder;

    @Test
    public void testPassword(){
        System.out.println(passwordEncoder.encode("123123"));
    }
}
