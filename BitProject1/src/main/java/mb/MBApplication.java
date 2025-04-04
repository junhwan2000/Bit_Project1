package mb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan( basePackages= { "mb", "logon", "board", "control.", "mail"} )
@MapperScan( basePackages= { "logon", "board"} )
public class MBApplication {
	public static void main( String[] args ) {
		SpringApplication.run( MBApplication.class );
	}
}
