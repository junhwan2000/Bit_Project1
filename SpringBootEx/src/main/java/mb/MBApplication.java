package mb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan( basePackages={ "mb", "logon", "board", "control.logon", "control.board" } )
@MapperScan( basePackages= { "logon", "board" } )
public class MBApplication {
	public static void main(String[] args) {
		SpringApplication.run( MBApplication.class );		
	}
}

// localhost:8080/logonmain
// localhost:8080/boardlist
