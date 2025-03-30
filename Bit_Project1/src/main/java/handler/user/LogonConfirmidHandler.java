package handler.user;

import dao.UserDao;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogonConfirmidHandler implements CommandHandler{
@Override
public String process(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {
	
	String user_id = request.getParameter("user_id");

	UserDao memberDao = UserDao.getInstance();
	int result = memberDao.check(user_id);

	request.setAttribute("result", result);
	request.setAttribute("user_id", user_id);
	
	return "/member/confirmid.jsp";
	
	}
}
