package com.faity.auth.authorication.service.impl;

import com.alicp.jetcache.anno.CacheType;
import com.alicp.jetcache.anno.Cached;
import com.fairy.common.response.Result;
import com.faity.auth.authorication.common.AuthenticationCommon;
import com.faity.auth.authorication.entity.PermissionDTO;
import com.faity.auth.authorication.provider.PermissionProvider;
import com.faity.auth.authorication.service.IPermissionService;
import com.faity.auth.authorication.service.NewMvcRequestMatcher;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Service
@Slf4j
public class PermissionService implements IPermissionService {

    @Autowired
    private HandlerMappingIntrospector mvcHandlerMappingIntrospector;

    @Autowired
    private PermissionProvider permissionProvider;

    /**
     * 系统中所有权限集合
     */
    private volatile Map<RequestMatcher, ConfigAttribute> resourceConfigAttributes = new ConcurrentHashMap<>();

    @Override
    public synchronized void savePermission(PermissionDTO permissionDTO) {
        resourceConfigAttributes.put(
                this.newMvcRequestMatcher(permissionDTO.getUrl(), permissionDTO.getMethod()),
                new SecurityConfig(permissionDTO.getName())
        );
        log.info("resourceConfigAttributes size:{}", resourceConfigAttributes.size());
    }


    @Override
    public synchronized void removeResource(PermissionDTO resource) {
        resourceConfigAttributes.remove(this.newMvcRequestMatcher(resource.getUrl(), resource.getMethod()));
        log.info("resourceConfigAttributes size:{}", resourceConfigAttributes.size());
    }

    @Override
    public synchronized void loadResource() {
        Result<Set<PermissionDTO>> resourcesResult = permissionProvider.perimissions();
        if (resourcesResult.isFail()) {
            System.exit(1);
        }
        Set<PermissionDTO> resources = resourcesResult.getData();
        Map<MvcRequestMatcher, SecurityConfig> tempResourceConfigAttributes = resources.stream()
                .collect(Collectors.toMap(
                        resource -> this.newMvcRequestMatcher(resource.getUrl(), resource.getMethod()),
                        resource -> new SecurityConfig(resource.getName())
                ));
        resourceConfigAttributes.putAll(tempResourceConfigAttributes);
        log.debug("init resourceConfigAttributes:{}", resourceConfigAttributes);
    }

    @Override
    public ConfigAttribute findConfigAttributesByUrl(HttpServletRequest authRequest) {
        return resourceConfigAttributes.keySet().stream()
                .filter(requestMatcher -> requestMatcher.matches(authRequest))
                .map(requestMatcher -> resourceConfigAttributes.get(requestMatcher))
                .peek(urlConfigAttribute -> log.debug("url在资源池中配置：{}", urlConfigAttribute.getAttribute()))
                .findFirst()
                .orElse(new SecurityConfig(AuthenticationCommon.NONEXISTENT_URL));
    }

    @Override
    @Cached(name = "permission::user", key = "#username", cacheType = CacheType.BOTH, expire = 5)
    public Set<PermissionDTO> queryByUsername(String username) {
        return permissionProvider.perimissions(username).getData();
    }


    /**
     * 创建RequestMatcher
     *
     * @param url
     * @param method
     * @return
     */
    private MvcRequestMatcher newMvcRequestMatcher(String url, String method) {
        return new NewMvcRequestMatcher(mvcHandlerMappingIntrospector, url, method);
    }
}