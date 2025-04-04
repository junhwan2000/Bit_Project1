package control.logon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/logonlogout")
public class LogonLogout {

	@GetMapping
	public String logout(HttpSession session) {
		// 세션 전체 무효화 (모든 로그인 정보 초기화)
		session.invalidate();
		
		// 로그아웃 후 이동할 페이지 (예: 로그인 페이지 또는 메인 페이지)
		return "member/main";  // or "redirect:/logonlogin"
	}
}
