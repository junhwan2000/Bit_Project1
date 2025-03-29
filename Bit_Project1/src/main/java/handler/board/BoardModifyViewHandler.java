package handler.board;

import dao.BoardDao;
import dto.BoardDto;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardModifyViewHandler implements CommandHandler{
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
	
		int num = Integer.parseInt( request.getParameter( "num" ) );
		String pageNum = request.getParameter( "pageNum" );
		String passwd = request.getParameter( "passwd" );
		
		BoardDao boardDao = BoardDao.getInstance();
		int result = boardDao.check( num, passwd );	
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		if (result == 1 ) {
			 BoardDto boardDto = boardDao.getArticle( num );
			 request.setAttribute("boardDto", boardDto);
		}
		
		return "/board/modifyView.jsp";
		
	}
}
