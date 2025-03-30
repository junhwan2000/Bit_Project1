package handler.user;


import java.sql.Date;
import java.sql.Timestamp;

import dao.UserDao;
import dto.UserDto;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class UserSignUpHandler implements CommandHandler{
@Override
public String process(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {
	
	request.setCharacterEncoding("utf-8");
	UserDto memberDto = new UserDto();
	   
	memberDto.setUser_id(request.getParameter("user_id"));
	memberDto.setPasswd(request.getParameter("passwd"));
	memberDto.setNickname(request.getParameter("nickname"));
	memberDto.setEmail(request.getParameter("email"));
	
	UserDao memberDao = UserDao.getInstance();
	int result = memberDao.insertMember(memberDto);
	
	request.setAttribute("result", result);

	return "/user/signUp.jsp";
	}
}
