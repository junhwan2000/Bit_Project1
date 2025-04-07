package handler.user;

import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogonLogoutHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.getSession().removeAttribute("memId");
		
		return "/member/main.jsp";
	}
}
