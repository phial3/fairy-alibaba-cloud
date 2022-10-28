package com.fairy.cloud.gateway.admin.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.amqp.support.converter.ContentTypeDelegatingMessageConverter;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BusConfig {


    private static final Logger LOGGER = LoggerFactory.getLogger(BusConfig.class);

    @Value("${rabbitmq.queue}")
    private String queueName;

    @Value("${rabbitmq.routingKey}")
    private String routingKey;

    @Value("${rabbitmq.exchange}")
    private String exchange;

    @Bean
    Queue queue() {
        LOGGER.info("queue name:{}", queueName);
        return new Queue(queueName, false);
    }

    @Bean
    TopicExchange exchange() {
        LOGGER.info("exchange:{}", exchange);
        return new TopicExchange(exchange);
    }

    @Bean
    Binding binding(Queue queue, TopicExchange exchange) {
        LOGGER.info("binding {} to {} with {}", queue, exchange, routingKey);
        return BindingBuilder.bind(queue).to(exchange).with(routingKey);
    }

    @Bean
    public MessageConverter messageConverter() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        return new ContentTypeDelegatingMessageConverter(new Jackson2JsonMessageConverter(objectMapper));
    }

}
