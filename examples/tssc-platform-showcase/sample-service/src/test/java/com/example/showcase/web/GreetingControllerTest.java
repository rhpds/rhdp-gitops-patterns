package com.example.showcase.web;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.test.web.server.LocalServerPort;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class GreetingControllerTest {

    @LocalServerPort
    private int port;

    @Test
    void greetingReturns200() {
        var restTemplate = new TestRestTemplate();
        var response = restTemplate.getForEntity("http://localhost:" + port + "/", String.class);
        assertThat(response.getStatusCode().is2xxSuccessful()).isTrue();
    }
}
