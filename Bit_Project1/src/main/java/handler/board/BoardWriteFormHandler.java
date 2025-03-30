package handler.board;

import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardWriteFormHandler implements CommandHandler{
@Override
public String process(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {
	
	// 제목글인 경우			// list.jsp에서 오는 경우
	int num = 0;			// 0 제목글 / ! 0 답글
	int ref = 1;			// 그룹화아이디
	
	// 답변글인 경우			// content.jsp에서 오는 경우
	if( request.getParameter( "num" ) != null ) {
		num = Integer.parseInt( request.getParameter( "num" ) );
		ref = Integer.parseInt( request.getParameter( "ref" ) );
	}

	request.setAttribute("num", num);
	request.setAttribute("ref", ref);
	return "/board/writeForm.jsp";
	
	}
}
