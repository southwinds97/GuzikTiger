package com.edu.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.edu.springboot", "utils"})
public class GuzikTigerApplication {

	public static void main(String[] args) {
		SpringApplication.run(GuzikTigerApplication.class, args);
	}

}
