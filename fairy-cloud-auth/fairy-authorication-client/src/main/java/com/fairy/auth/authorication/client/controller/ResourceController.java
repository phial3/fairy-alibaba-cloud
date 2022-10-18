package com.fairy.auth.authorication.client.controller;

import com.fairy.auth.authorication.client.service.IPermissionService;
import com.fairy.common.entity.dto.PermissionDTO;
import com.fairy.common.response.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;

/**
 * @author 鹿少年
 * @date 2022/10/18 11:46
 */
@RestController
@Slf4j
@RequestMapping("/permission")
public class ResourceController {

    @Autowired
    private IPermissionService permissionService;

    @GetMapping(value = "/all")
    Result<List<PermissionDTO>> perimissions(){
        List<PermissionDTO> permissionDTOS= permissionService.allPermissions();
        return Result.success(permissionDTOS);
    }

    @GetMapping(value = "/user/{username}")
    Result<List<PermissionDTO>> perimissions(@PathVariable("username") String username){
        List<PermissionDTO> permissionDTOS= permissionService.selectPermissionsByUserName( username);
        return Result.success(permissionDTOS);
    }
}
