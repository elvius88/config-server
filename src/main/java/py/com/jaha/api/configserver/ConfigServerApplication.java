package py.com.jaha.api.configserver;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.cloud.config.server.EnableConfigServer;

import java.net.InetAddress;
import org.springframework.context.event.EventListener;

@Slf4j
@SpringBootApplication
@EnableConfigServer
public class ConfigServerApplication {

	public static void main(String[] args) {

		try {
			String hostAddress = InetAddress.getLocalHost().getHostAddress();
			System.setProperty("hostIp",hostAddress);
		} catch (Exception e) {
			log.error("Could not get IP for hostIp attribute");
		}

		SpringApplication.run(ConfigServerApplication.class, args);
	}

	@EventListener(ApplicationReadyEvent.class)
	public void doAfterStartup() {
		log.info("Config Server has already started");
	}
}
