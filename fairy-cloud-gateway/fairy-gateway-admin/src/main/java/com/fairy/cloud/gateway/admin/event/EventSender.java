package com.fairy.cloud.gateway.admin.event;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @author 鹿少年
 * @date 2022/10/28 19:57
 */
@Component
public class EventSender {

    private final static Logger LOGGER = LoggerFactory.getLogger(EventSender.class);

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Autowired
    private MessageConverter messageConverter;

    @Value("${rabbitmq.exchange}")
    private String exchangeName;

    @PostConstruct
    public void init() {
        rabbitTemplate.setMessageConverter(messageConverter);
    }

    public void send(String routingKey, Object object) {
        LOGGER.info("routingKey:{}=>message:{}", routingKey, object);
        rabbitTemplate.convertAndSend(exchangeName, routingKey, object);
    }
}
