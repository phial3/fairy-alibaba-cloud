package com.fairy.cloud.product.zk;

public interface ZKLock {

    boolean lock(String lockpath);

    boolean unlock(String lockpath);

}
