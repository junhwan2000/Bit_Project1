package handler;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DefaultHandler implements CommandHandler{

	@Override
public String process(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
	request.setAttribute("result", "처리할 수 있는 요청이 없습니다.");	
	return "/member/default.jsp";
	}
}
