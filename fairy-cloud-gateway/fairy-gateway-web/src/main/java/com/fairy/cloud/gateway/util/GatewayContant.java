package com.fairy.cloud.gateway.util;

import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

public class GatewayContant {
    public static final String STR_PREDICATE = "predicate";

    public static final String STR_FILTER = "filter";

    public static final String REDIS_KEY_VERSION = "gateway:version";

    public  static final AtomicLong version=new AtomicLong(0);

    public static final AtomicBoolean init= new AtomicBoolean(false);
}
