package handler.user;

import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogonMainHandler implements CommandHandler{
@Override
public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
	String memId = (String) request.getSession().getAttribute("memId");
	request.setAttribute("memId", memId);
	return "/member/main.jsp";
	}
}
