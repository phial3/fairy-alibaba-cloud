package com.fairy.zipkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/10/18 11:46
 */
@RestController
public class ResourceController {


    @GetMapping(value = "/hello")
    String  perimissions(){

        return "hello zipkin ";
    }

}
