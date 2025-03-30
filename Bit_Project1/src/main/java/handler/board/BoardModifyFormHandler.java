package handler.board;

import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardModifyFormHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		int num = Integer.parseInt( request.getParameter( "num" ) );
		String pageNum = request.getParameter( "pageNum" );
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		
		return "/board/modifyForm.jsp";
		
	}
}
