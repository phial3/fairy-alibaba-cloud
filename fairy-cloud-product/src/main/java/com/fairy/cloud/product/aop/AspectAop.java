package com.fairy.cloud.product.aop;

import io.micrometer.core.instrument.Counter;
import io.micrometer.core.instrument.MeterRegistry;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @author 鹿少年
 * @date 2022/10/24 22:28
 */
@Slf4j
@Component
@Aspect
public class AspectAop {

    @Pointcut("execution(public * com.fairy.cloud.product.controller.*.*(..))")
    public void pointCut() {
    }

    //统计请求的处理时间
    ThreadLocal<Long> startTime = new ThreadLocal<>();

    @Autowired
    MeterRegistry registry;
    //统计
    private Counter counter;

    @PostConstruct
    private void init() {
        counter = registry.counter("requests_total", "status", "success");
    }

    @Before("pointCut()")
    public void doBefore(JoinPoint joinPoint) throws Throwable {
        startTime.set(System.currentTimeMillis());
        //记录系统总请求数
        counter.increment();
    }

    @AfterReturning(returning = "returnVal", pointcut = "pointCut()")
    public void doAfterReturning(Object returnVal) {
        //处理完请求后
        log.info("方法执行时间:{}", (System.currentTimeMillis() - startTime.get()));
    }
}

