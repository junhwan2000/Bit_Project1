package control.logon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping( "/logon/logout" )
public class LogoutControl {
	@GetMapping
	public String logout( HttpSession session ) {
		session.removeAttribute( "memId" );
		return "member/main";
	}
}
