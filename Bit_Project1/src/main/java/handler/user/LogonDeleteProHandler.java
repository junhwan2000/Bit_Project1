package handler.user;

import dao.UserDao;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogonDeleteProHandler implements CommandHandler{
@Override
public String process(HttpServletRequest request, HttpServletResponse response)
		
		throws Exception {
	
	
	String user_id = (String) request.getSession().getAttribute("memId");
	String passwd = request.getParameter("passwd");

	UserDao memberDao = UserDao.getInstance();
	int resultCheck = memberDao.check(user_id,passwd);
	request.setAttribute("resultCheck", resultCheck);
	if(resultCheck == 1) {
		int result = memberDao.deleteMember(user_id);
		request.setAttribute("result", result);
		if (result == 1) {
			request.getSession().removeAttribute("memId");
		}
	}
	return "/member/deletePro.jsp";
	}
}
