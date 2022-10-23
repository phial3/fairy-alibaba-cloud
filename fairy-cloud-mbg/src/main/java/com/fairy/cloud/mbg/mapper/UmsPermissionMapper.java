package com.fairy.cloud.mbg.mapper;

import com.fairy.cloud.mbg.model.pojo.UmsPermissionPO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fairy.common.entity.dto.PermissionDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * 后台用户权限表
 * 
 * @author é¹¿å°å¹´
 * @email 
 * @date 2022-08-02 21:07:38
 */
@Mapper
public interface UmsPermissionMapper extends BaseMapper<UmsPermissionPO> {
    /**
     * 根据用户名查询用户权限
     * @param username
     * @return
     */
    List<PermissionDTO> selectPermissionsByUserName(@Param("userName") String username);

    /**
     * 查询用户权限
     * @param userName
     * @param url
     * @param method
     * @return
     */
    PermissionDTO selectPermissionByUserNameAndUrlMethod(@Param("userName")String userName,
                                                         @Param("url")String url,
                                                         @Param("method")String method);
}
