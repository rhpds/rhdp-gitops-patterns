package com.example.showcase.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {

    @GetMapping("/")
    public String greet() {
        return "TSSC platform showcase — sample-service is running.";
    }
}
