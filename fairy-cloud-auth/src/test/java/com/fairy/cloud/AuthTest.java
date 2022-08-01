package com.fairy.cloud;

import com.fairy.cloud.auth.AuthApp;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author 鹿少年
 * @date 2022/8/1 11:51
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = {AuthApp.class})
public class AuthTest {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    public void test(){
        System.out.println(passwordEncoder.encode("123123"));
        System.out.println(passwordEncoder.encode("admin"));
        System.out.println(passwordEncoder.encode("test"));
    }
}
