package org.novaride.modelentity;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing

public class ModelEntityApplication {

	public static void main(String[] args) {
		SpringApplication.run(ModelEntityApplication.class, args);
	}

}
