package handler.user;

import dao.UserDao;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogonLoginProHandler implements CommandHandler{
@Override
public String process(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
	
	String user_id = request.getParameter("user_id");
	String passwd = request.getParameter("passwd");

	UserDao memberDao = UserDao.getInstance();
	int result = memberDao.check(user_id, passwd);
	if( result == 1 ) {
		
		request.getSession().setAttribute("memId", user_id);
	}
	
	request.setAttribute("result", result);
	
	return "/member/loginPro.jsp";
	}
}
