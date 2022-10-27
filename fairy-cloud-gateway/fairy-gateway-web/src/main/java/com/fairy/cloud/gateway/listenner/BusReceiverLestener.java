package com.fairy.cloud.gateway.listenner;

import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @author 鹿少年
 * @date 2022/10/25 21:39
 */
//@Component
//public class BusReceiverLestener {
//
//    @RabbitListener(queues= "${rabbitmq.queue}")
//    public void directReceive22(Message message, Channel channel, String messageStr) {
//        System.out.println("consumer1 received message : " +messageStr);
//    }
//}
