package com.fairy.cloud.auth.model;

import com.fairy.cloud.mbg.model.pojo.UmsMemberPO;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;


/**
 * 会员详情封装
 *
 * @author 鹿少年
 * @version 1.0
 * @date 2022/4/30 21:28
 */
@Data
public class MemberDetails implements UserDetails {
    private UmsMemberPO umsMember;
    /**
     * 用户权限集合
     */
    private List<GrantedAuthority> authorities;

    public MemberDetails(UmsMemberPO umsMember) {
        this.umsMember = umsMember;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        //返回当前用户的权限
        return authorities;
    }

    @Override
    public String getPassword() {
        return umsMember.getPassword();
    }

    @Override
    public String getUsername() {
        return umsMember.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return umsMember.getStatus() == 1;
    }

    public UmsMemberPO getUmsMember() {
        return umsMember;
    }
}
