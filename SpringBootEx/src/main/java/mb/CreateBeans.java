package mb;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

@Configuration
public class CreateBeans {
	/*
	@Bean
	public LogonDao logonDao() {
		return new LogonDBBean();
	}
	*/	
	/*
	@Bean
	public BoardDao boardDao() {
		return new BoardDBBean(); 
	}
	*/
	@Bean
	public MultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass( JstlView.class );
		viewResolver.setPrefix( "/" );
		viewResolver.setSuffix( ".jsp" );
		return viewResolver;
	}
	
	
	/*
	@Bean
	public DataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setUrl( "jdbc:oracle:thin:@localhost:1521:xe" );
		dataSource.setDriverClassName( "oracle.jdbc.driver.OracleDriver" );
		dataSource.setUsername( "bit" );
		dataSource.setPassword( "bit" );
		dataSource.setInitialSize( 10 );
		dataSource.setMaxTotal( 5 );
		dataSource.setMaxWait( Duration.ofMillis( 3000 ) );
		return dataSource;
	}
	*/
	
	/*
	@Bean
	public LogonDao logonDao() {
		LogonDBBean logonDao = new LogonDBBean();
		logonDao.setDataSource( dataSource() );
		return logonDao;
	}
	
	@Bean
	public BoardDao boardDao() {
		BoardDBBean boardDao = new BoardDBBean();
		boardDao.setDataSource( dataSource() );
		return boardDao;
	}
	*/
	
}






