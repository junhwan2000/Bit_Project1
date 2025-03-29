package handler.board;

import dao.BoardDao;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardDeleteProHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		int num = Integer.parseInt( request.getParameter( "num" ) );
		String passwd = request.getParameter( "passwd" );
		String pageNum = request.getParameter( "pageNum" );
	
		BoardDao boardDao = BoardDao.getInstance();
		int resultCheck = boardDao.check( num, passwd );
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("resultCheck", resultCheck);
		
		if(resultCheck == 1) {
			int result = boardDao.deleteArticle( num );
			request.setAttribute("result", result);
		}
		
		return "/board/deletePro.jsp";
	}

}
