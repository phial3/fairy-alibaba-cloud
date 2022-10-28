package com.fairy.cloud.gateway.service.impl;

import com.fairy.cloud.gateway.service.IRouteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class MysqlRouteService implements IRouteService {

    private static final Logger LOGGER = LoggerFactory.getLogger(MysqlRouteService.class);

    @Override
    public Collection<RouteDefinition> getRouteDefinitions() {
        return null;
    }

    @Override
    public boolean save(RouteDefinition routeDefinition) {
        return false;
    }

    @Override
    public boolean delete(String routeId) {
        return false;
    }
}
