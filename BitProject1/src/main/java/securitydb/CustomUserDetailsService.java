package securitydb;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;
import java.util.Collections;
@Service
public class CustomUserDetailsService implements UserDetailsService {
    private final UserMapper userMapper;
    public CustomUserDetailsService( UserMapper userMapper ) {
        this.userMapper = userMapper;
    }

    @Override
    public UserDetails loadUserByUsername( String userId ) throws UsernameNotFoundException {	    	
       	User user = userMapper.findByUserId( userId ).orElseThrow(
			() -> new UsernameNotFoundException( "User not found" ) );
      	return new org.springframework.security.core.userdetails.User(
       		user.getUserId(), user.getPasswd(),
       		Collections.singletonList( new SimpleGrantedAuthority( user.getRole() ) )
      	);
  	}	
}