package handler.user;

import java.sql.Timestamp;

import dto.UserDto;
import dao.UserDao;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogonInputProHandler implements CommandHandler{
@Override
public String process(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

	    request.setCharacterEncoding("utf-8");
		UserDto memberDto = new UserDto();
	    memberDto.setUser_id(request.getParameter("user_id"));
	    memberDto.setPasswd(request.getParameter("passwd"));
	    memberDto.setNickname(request.getParameter("nickname"));
		
		// email
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = null;		
		
		if(! email1.equals("")){
			if(email2.equals("1")) {
				email = email1;
			} else {
				email= email1 + "@" + email2;
			}
		}
		memberDto.setEmail(email);
		
	
		// 싱글톤 패턴 
		UserDao memberDao = UserDao.getInstance();
		int result = memberDao.insertMember(memberDto);
		
		request.setAttribute("result", result);
		
		return "/member/inputPro.jsp";
	}
}
