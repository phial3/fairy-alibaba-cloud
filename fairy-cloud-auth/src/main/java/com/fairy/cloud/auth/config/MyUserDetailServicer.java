package com.fairy.cloud.auth.config;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fairy.cloud.auth.model.MemberDetails;
import com.fairy.cloud.mbg.mapper.UmsMemberMapper;
import com.fairy.cloud.mbg.mapper.UmsRoleMapper;
import com.fairy.cloud.mbg.model.pojo.UmsMemberPO;
import com.fairy.cloud.mbg.model.pojo.UmsRolePO;
import com.fairy.common.constants.RedisKeyPrefixConst;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.stream.Collectors;


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
    private UmsRoleMapper umsRoleMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        if (StringUtils.isEmpty(userName)) {
            log.warn("用户登陆用户名为空:{}", userName);
            throw new UsernameNotFoundException("用户名不能为空");
        }
        UmsMemberPO umsMember = getByUsername(userName);
        if (null == umsMember) {
            log.warn("根据用户名没有查询到对应的用户信息:{}", userName);
        }
        log.info("根据用户名:{}获取用户登陆信息:{}", userName, umsMember);
        MemberDetails memberDetails = new MemberDetails(umsMember);
        //查看用户的权限
        List<UmsRolePO> roles = umsRoleMapper.selectRolesByUserName(umsMember.getUsername());
        List<String> roleNames = roles.stream().map(UmsRolePO::getName).collect(Collectors.toList());
        String authorities = roles.stream().map(UmsRolePO::getName).collect(Collectors.joining(","));
        memberDetails.setAuthorities(AuthorityUtils.commaSeparatedStringToAuthorityList(authorities));
        //查询出角色的权限 permission缓存到redis中  需要刷新 如果存在redis的读写  再加一个全局的easyJob定时任务补偿
//        List<String> url = umsRoleMapper.selectRolePermissionUrlByRoleIds(roleIds);
        for (String roleName : roleNames) {
            List<String> urls = umsRoleMapper.selectRolePermissionUrlByRoleName(roleName);
            redisTemplate.opsForValue().set(RedisKeyPrefixConst.USER_ROLE_PERMISSIOn + ":" + roleName, urls);
        }
        return memberDetails;
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
}
