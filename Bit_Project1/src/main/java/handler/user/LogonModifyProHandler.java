package handler.user;

import dao.UserDao;
import dto.UserDto;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogonModifyProHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		UserDto memberDto = new UserDto();
		memberDto.setUser_id(request.getParameter("user_id"));
		memberDto.setPasswd(request.getParameter("passwd"));
		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = null;
		
		if(!email1.equals("") && !email2.equals("")) {
			email = email1 + "@" + email2;	
		}
		memberDto.setEmail(email);
	
		UserDao memberDao = UserDao.getInstance();
		int result = memberDao.modifyMember(memberDto);
		
		request.setAttribute("result", result);
		
		return "/member/modifyPro.jsp";
	}

}
