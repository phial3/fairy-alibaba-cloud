package com.fairy.authorication.resouce.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fairy.authorication.resouce.service.IPermissionService;
import com.fairy.cloud.mbg.mapper.UmsPermissionMapper;
import com.fairy.cloud.mbg.model.pojo.UmsPermissionPO;
import com.fairy.common.entity.dto.PermissionDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author 鹿少年
 * @date 2022/10/18 11:47
 */
@Slf4j
@Service
public class PermissionService implements IPermissionService {
    @Resource
    private UmsPermissionMapper permissionMapper;

    @Override
    public List<PermissionDTO> allPermissions() {

        List<UmsPermissionPO> list = permissionMapper.selectList(new QueryWrapper<UmsPermissionPO>());
        List<PermissionDTO> permissionDTOS = list.stream().flatMap(new Function<UmsPermissionPO, Stream<PermissionDTO>>() {
            @Override
            public Stream<PermissionDTO> apply(UmsPermissionPO permissionPO) {
                PermissionDTO dto = new PermissionDTO();
                BeanUtils.copyProperties(permissionPO, dto);
                return Stream.of(dto);
            }
        }).collect(Collectors.toList());
        return permissionDTOS;
    }

    @Override
    public List<PermissionDTO> selectPermissionsByUserName(String username) {
        return permissionMapper.selectPermissionsByUserName(username);
    }
}
