package securitydb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan( basePackages= { "securitydb", "mb", "logon", "control.logon" } )
@MapperScan( basePackages= { "securitydb", "logon" } )
public class SecurityDBApplication {
	public static void main(String[] args) {
		SpringApplication.run( SecurityDBApplication.class, args );
	}
}
