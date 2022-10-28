package com.fairy.cloud.gateway.config;

import com.fairy.cloud.gateway.listenner.BusReceiver;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.listener.SimpleMessageListenerContainer;
import org.springframework.amqp.rabbit.listener.adapter.MessageListenerAdapter;
import org.springframework.amqp.support.converter.ContentTypeDelegatingMessageConverter;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 消息总线 rabbitmq bus
 * @author 鹿少年
 * @date 2022/10/18 20:01
 */
@Configuration
@Slf4j
public class BusConfig {

    @Value("${rabbitmq.queue}")
    private String queueName;

    @Value("${rabbitmq.routingKey}")
    private String routingKey;

    @Value("${rabbitmq.exchange}")
    private String exchange;

    @Bean
    Queue queue() {
//        String queueName = new Base64UrlNamingStrategy(appName + ".").generateName();
        log.info("queue name:{}", queueName);
        return new Queue(queueName, false);
    }

    @Bean
    TopicExchange exchange() {
        log.info("exchange:{}", exchange);
        return new TopicExchange(exchange);
    }

    @Bean
    Binding binding(Queue queue, TopicExchange exchange) {
        log.info("binding {} to {} with {}", queue, exchange, routingKey);
        return BindingBuilder.bind(queue).to(exchange).with(routingKey);
    }

    @Bean
    SimpleMessageListenerContainer simpleMessageListenerContainer(ConnectionFactory connectionFactory, MessageListenerAdapter messageListenerAdapter, Queue queue) {
        log.info("init simpleMessageListenerContainer: {}", queue.getName());
        SimpleMessageListenerContainer container = new SimpleMessageListenerContainer();
        container.setQueueNames(queue.getName());
        container.setMessageListener(messageListenerAdapter);
        container.setAcknowledgeMode(AcknowledgeMode.MANUAL);
        container.setConnectionFactory(connectionFactory);
        container.setConcurrency("3");
        container.setMaxConcurrentConsumers(4);
        return container;
    }

//    @Bean
//    public SimpleRabbitListenerContainerFactory getSimpleRabbitListenerContainerFactory(ConnectionFactory connectionFactory) {
//        SimpleRabbitListenerContainerFactory factory = new SimpleRabbitListenerContainerFactory();
//        factory.setMaxConcurrentConsumers(4);
//        factory.setConnectionFactory(connectionFactory);
//        factory.setAcknowledgeMode(AcknowledgeMode.MANUAL);//手动确认
//        return factory;
//    }

    @Bean
    MessageListenerAdapter messageListenerAdapter(BusReceiver busReceiver, MessageConverter messageConverter) {
        log.info("new listener");
        return new MessageListenerAdapter(busReceiver, messageConverter);
    }

    @Bean
    public MessageConverter messageConverter() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        return new ContentTypeDelegatingMessageConverter(new Jackson2JsonMessageConverter(objectMapper));
    }
}

