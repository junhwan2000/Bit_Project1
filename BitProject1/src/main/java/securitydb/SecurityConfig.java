package securitydb;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
// import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
// import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	private final UserDetailsService userDetailsService;
  	public SecurityConfig( UserDetailsService userDetailsService ) {
      	this.userDetailsService = userDetailsService;
   	}	 
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public AuthenticationManager authenticationManager( AuthenticationConfiguration authenticationConfiguration) 
		throws Exception {
      	return authenticationConfiguration.getAuthenticationManager();
    }  	
	@Bean
	public WebSecurityCustomizer webSecurityCustomizer() {
		return web -> web.ignoring()
				.requestMatchers(  "/static/board/**", "/static/logon/**", "/static/images" );
	}
	@Bean
	public SecurityFilterChain filterChain( HttpSecurity http ) throws Exception {		
		http.csrf(
			AbstractHttpConfigurer::disable
		).authorizeHttpRequests(
			authz -> authz.requestMatchers( "/logon/**", "/member/**" ).permitAll()
			//.requestMatchers( "/member/**" ).hasRole( "MEMBER" )
			//.requestMatchers( "/admin/**" ).hasRole( "ADMIN" )
			.anyRequest().authenticated()
		).httpBasic(
			AbstractHttpConfigurer::disable

		).formLogin(
			f -> f.loginPage( "/logon/login" )
				.usernameParameter( "userId" )
				.passwordParameter( "passwd" )
				.defaultSuccessUrl( "/logon/main", true )
		).logout(
			f -> f.logoutUrl( "/logon/logout" )
				.invalidateHttpSession( true )				// 세션무효화
				.deleteCookies( "JSESSIONID" )				// 쿠키 삭제
				.logoutSuccessUrl( "/logon/main" )
		);
		return http.build();
	}
}







