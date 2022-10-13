package com.fairy.auth.authorization.oauth2.granter;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fairy.cloud.mbg.mapper.UmsMemberMapper;
import com.fairy.cloud.mbg.mapper.UmsRoleMapper;
import com.fairy.cloud.mbg.model.pojo.UmsMemberPO;
import com.fairy.cloud.mbg.model.pojo.UmsRolePO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 鹿少年
 * @date 2022/10/13 20:09
 */
@Slf4j
@Service("userDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UmsMemberMapper memberMapper;
    @Autowired
    private UmsRoleMapper umsRoleMapper;


    @Override
    public UserDetails loadUserByUsername(String userName) {

        if (StringUtils.isEmpty(userName)) {
            log.warn("用户登陆用户名为空:{}", userName);
            throw new UsernameNotFoundException("用户名不能为空");
        }
        UmsMemberPO umsMember = getByUsername(userName);
        if (null == umsMember) {
            log.warn("根据用户名没有查询到对应的用户信息:{}", userName);
        }
        log.info("根据用户名:{}获取用户登陆信息:{}", userName, umsMember);
        return new User(
                umsMember.getUsername(),
                umsMember.getPassword(),
                umsMember.getEnabled(),
                umsMember.getAccountNonExpired(),
                umsMember.getCredentialsNonExpired(),
                umsMember.getAccountNonLocked(),
                this.obtainGrantedAuthorities(umsMember));
    }

    /**
     * 根据用户名获取用户信息
     *
     * @param username 用戶名
     * @return UmsMember
     */
    private UmsMemberPO getByUsername(String username) {
        QueryWrapper<UmsMemberPO> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UmsMemberPO::getUsername, username);
        List<UmsMemberPO> memberList = memberMapper.selectList(wrapper);
        if (!CollectionUtils.isEmpty(memberList)) {
            return memberList.get(0);
        }
        return null;
    }

    /**
     * 获得登录者所有角色的权限集合.
     *
     * @param user
     * @return
     */
    protected List<GrantedAuthority> obtainGrantedAuthorities(UmsMemberPO user) {
        List<UmsRolePO> roles = umsRoleMapper.selectRolesByUserName(user.getUsername());
//        String authorities = roles.stream().map(UmsRolePO::getName).collect(Collectors.joining(","));
//        return AuthorityUtils.commaSeparatedStringToAuthorityList(authorities);
        return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());

    }
}

