package com.fairy.cloud.auth.config;

import com.fairy.cloud.auth.model.MemberDetails;
import com.fairy.cloud.mbg.mapper.UmsMemberMapper;
import com.fairy.cloud.mbg.model.UmsMember;
import com.fairy.cloud.mbg.model.UmsMemberExample;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;


/**
 * 认证服务器加载用户的类
 *
 * @author 鹿少年
 * @version 1.0
 * @date 2022/4/30 21:28
 */
@Slf4j
@Component
public class MyUserDetailServicer implements UserDetailsService {

    @Autowired
    private UmsMemberMapper memberMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        if (StringUtils.isEmpty(userName)) {
            log.warn("用户登陆用户名为空:{}", userName);
            throw new UsernameNotFoundException("用户名不能为空");
        }
        UmsMember umsMember = getByUsername(userName);
        if (null == umsMember) {
            log.warn("根据用户名没有查询到对应的用户信息:{}", userName);
        }
        log.info("根据用户名:{}获取用户登陆信息:{}", userName, umsMember);
        MemberDetails memberDetails = new MemberDetails(umsMember);
        return memberDetails;
    }

    /**
     * 根据用户名获取用户信息
     *
     * @param username 用戶名
     * @return UmsMember
     */
    private UmsMember getByUsername(String username) {
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andUsernameEqualTo(username);
        List<UmsMember> memberList = memberMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(memberList)) {
            return memberList.get(0);
        }
        return null;
    }
}
