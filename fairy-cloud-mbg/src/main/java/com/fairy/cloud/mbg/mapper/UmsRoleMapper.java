package com.fairy.cloud.mbg.mapper;

import com.fairy.cloud.mbg.model.UmsRole;
import com.fairy.cloud.mbg.model.UmsRoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

import javax.management.relation.Role;

public interface UmsRoleMapper {
    long countByExample(UmsRoleExample example);

    int deleteByExample(UmsRoleExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UmsRole record);

    int insertSelective(UmsRole record);

    List<UmsRole> selectByExample(UmsRoleExample example);

    UmsRole selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UmsRole record, @Param("example") UmsRoleExample example);

    int updateByExample(@Param("record") UmsRole record, @Param("example") UmsRoleExample example);

    int updateByPrimaryKeySelective(UmsRole record);

    int updateByPrimaryKey(UmsRole record);

    /**
     * 根据用户名查询角色信息
     * @param username 用户名
     * @return 角色集合
     */
    List<UmsRole> selectRolesByUserName(@Param("username") String username);

    /**
     * 查询用户的角色权限集合
     * @param roleIds 角色Ids
     * @return 权限信息
     */
    List<String> selectRolePermissionUrlByRoleIds(@Param("roleIds") List<Integer> roleIds);

    List<String> selectRolePermissionUrlByRoleName(@Param("roleName") String roleName);
}