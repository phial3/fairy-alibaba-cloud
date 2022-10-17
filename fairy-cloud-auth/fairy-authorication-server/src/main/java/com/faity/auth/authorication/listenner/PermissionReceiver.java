package com.faity.auth.authorication.listenner;

import com.fairy.cloud.mbg.model.pojo.UmsPermissionPO;
import com.faity.auth.authorication.entity.PermissionDTO;
import com.faity.auth.authorication.service.impl.PermissionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author 鹿少年
 * @date 2022/10/17 19:02
 */
@Component
@Slf4j
public class PermissionReceiver {
    @Autowired
    private PermissionService permissionService;

    public void handleMessage(PermissionDTO permissionDTO) {
        log.info("Received Message:<{}>", permissionDTO);
        permissionService.savePermission(permissionDTO);
    }
}
