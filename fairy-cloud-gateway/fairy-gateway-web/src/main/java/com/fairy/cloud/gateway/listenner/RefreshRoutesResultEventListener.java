package com.fairy.cloud.gateway.listenner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.gateway.event.RefreshRoutesResultEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

/**
 * 自己实现监听 路由事件发布结果
 *
 * @author 鹿少年
 * @date 2022/10/30 17:03
 */
@Component
public class RefreshRoutesResultEventListener implements ApplicationListener<RefreshRoutesResultEvent> {

    private static final Logger LOGGER = LoggerFactory.getLogger(RefreshRoutesResultEventListener.class);


    @Override
    public void onApplicationEvent(RefreshRoutesResultEvent event) {
        if (event.isSuccess()) {
            LOGGER.info("RefreshRoutesResultEventListener | refresh routes success. event:{}", event);
        } else {
            LOGGER.error("RefreshRoutesResultEventListener | refresh routes failed. event:{} e:{}",
                    event, event.getThrowable());
        }

    }
}
