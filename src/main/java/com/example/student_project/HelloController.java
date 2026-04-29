package com.example.student_project;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String sayHello() {
        return "Hello DevOps - Java Edition";
    }

    @GetMapping("/health")
    public String healthCheck() {
        return "Status: UP";
    }
}