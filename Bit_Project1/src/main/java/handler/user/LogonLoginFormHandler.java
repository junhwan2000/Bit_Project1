package handler.user;

import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogonLoginFormHandler implements CommandHandler{
@Override
public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
	
	return "/member/loginForm.jsp";
	}
}
