package com.fairy.authorization.password;

import com.fairy.auth.authorization.Oauth2AuthorizationApplication;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author 鹿少年
 * @date 2022/10/16 20:20
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Oauth2AuthorizationApplication.class)
public class TestJwtAccessToken {

    @Value("${spring.security.oauth2.jwt.signingKey}")
    private String signingKey;

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");


    @Test
    public void testJwt() {
        Jws<Claims> jws = Jwts.parser().setSigningKey(signingKey.getBytes())
                .parseClaimsJws(
"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXNzd29yZCI6bnVsbCwidXNlcl9uYW1lIjoidGVzdCIsInNjb3BlIjpbInJlYWQiXSwib3JnYW5pemF0aW9uIjoidGVzdCIsImV4cCI6MTY2NTkyNTE5MiwiYXV0aG9yaXRpZXMiOlsicHJvZHVjdF9jYXRvcnlfYWRtaW4iLCJwcm9kdWN0X2FkbWluIl0sImp0aSI6ImY3Njg0MmIwLTNhZTEtNDU3ZS1hMDliLWM4NzJiMDk3MmJiNCIsImNsaWVudF9pZCI6ImNsaWVudCIsIm1lbWJlcklkIjoidGVzdCJ9.bxNDzsXZdPKT6lFupa_6EYWXuKhoVtbJNvdnFY0QGMs"
                );
        System.out.println(jws.getSignature());
        System.out.println(jws.getBody());
        System.out.println(jws.getHeader());
        Claims claims1 =jws.getBody();

        Date d1 = claims1.getIssuedAt();
        Date d2 = claims1.getExpiration();
        System.out.println("username参数值：" + claims1.get("username"));
        System.out.println("登录用户的id：" + claims1.getId());
        System.out.println("登录用户的名称：" + claims1.getSubject());
        System.out.println("令牌签发时间：" + sdf.format(d1));
        System.out.println("令牌过期时间：" + sdf.format(d2));


    }
}
