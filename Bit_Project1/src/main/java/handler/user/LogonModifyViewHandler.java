package handler.user;

import dao.UserDao;
import dto.UserDto;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogonModifyViewHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		String user_id = (String)  request.getSession().getAttribute("memId");
		String passwd = request.getParameter("passwd");
	
		UserDao memberDao = UserDao.getInstance();
		int result = memberDao.check(user_id,passwd);
		request.setAttribute("result", result);
		if(result==1) {
			UserDto memberDto = memberDao.getMember(user_id);
			request.setAttribute("memberDto",memberDto);
		}
		
		return "/member/modifyView.jsp";
	}

}
