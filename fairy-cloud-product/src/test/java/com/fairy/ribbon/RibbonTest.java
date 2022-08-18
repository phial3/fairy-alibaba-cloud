package com.fairy.ribbon;

import com.fairy.cloud.product.ProduceApp;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author 鹿少年
 * @date 2022/8/18 21:07
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = ProduceApp.class)
public class RibbonTest {

    @Autowired
    private DiscoveryClient discoveryClient;


    @Test
    public void testDiscovery(){
        getUri("fairy-cloud-product");
    }

    public String getUri(String serviceName) {
        List<ServiceInstance> serviceInstances = discoveryClient.getInstances(serviceName);
        if (serviceInstances == null || serviceInstances.isEmpty()) {
            return null;
        }
        int serviceSize = serviceInstances.size();
        //轮询
        int indexServer = incrementAndGetModulo(serviceSize);
        return serviceInstances.get(indexServer).getUri().toString();
    }

    private AtomicInteger nextIndex = new AtomicInteger(0);

    private int incrementAndGetModulo(int modulo) {
        for (; ; ) {
            int current = nextIndex.get();
            int next = (current + 1) % modulo;
            if (nextIndex.compareAndSet(current, next) && current < modulo) {
                return current;
            }
        }
    }
}
