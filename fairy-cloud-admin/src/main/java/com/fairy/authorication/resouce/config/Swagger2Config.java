package com.fairy.authorication.resouce.config;

import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * swagger配置类
 * @author 鹿少年
 * @date 2022/10/21 20:29
 */
@Configuration
@EnableSwagger2
public class Swagger2Config {


    @Value("${swagger.enable}")
    private boolean enable;

    @Bean
    public Docket index() {
        return new Docket(DocumentationType.SWAGGER_2)
                .enable(enable)
                .groupName("cloud System")
                .select()
//                .apis(RequestHandlerSelectors.basePackage("com.fairy.config.controller.index"))
                .apis(RequestHandlerSelectors.withClassAnnotation(Api.class))
                .paths(PathSelectors.any())
                .build()
                .useDefaultResponseMessages(true)
                .forCodeGeneration(false)
                .apiInfo(apiInfo());
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("Auth 认证")
                .description("auth resource 资源信息")
                .version("1.0")
                .build();
    }

}
