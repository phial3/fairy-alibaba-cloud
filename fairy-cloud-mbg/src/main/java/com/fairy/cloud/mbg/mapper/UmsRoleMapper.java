package com.fairy.cloud.mbg.mapper;

import com.fairy.cloud.mbg.model.pojo.UmsRolePO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 后台用户角色表
 * 
 * @author é¹¿å°å¹´
 * @email 
 * @date 2022-08-02 21:00:44
 */
@Mapper
public interface UmsRoleMapper extends BaseMapper<UmsRolePO> {

    List<String> selectRolePermissionUrlByRoleName(@Param("roleName") String roleName);

    List<UmsRolePO> selectRolesByUserName(@Param("username") String username);
}
