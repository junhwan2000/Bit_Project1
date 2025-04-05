package control.logon;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpSession;
import logon.LogonDBBean;

@Controller
@RequestMapping( "/logon/login" )
public class LoginControl {
	@Resource
	private LogonDBBean logonDao;
	
	@GetMapping
	public String loginForm() throws Exception {
		return "member/loginForm";
	}
	
	@PostMapping
	public String loginPro( @RequestParam String userId, @RequestParam String passwd, 
			Model model, HttpSession session ) throws Exception {
		int result = logonDao.check(userId, passwd);
		if( result == 1 )
			session.setAttribute("memId", userId);
		model.addAttribute("result", result);
		return "member/loginPro";
	}
}
