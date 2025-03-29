package handler.board;

import dao.BoardDao;
import dto.BoardDto;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardModifyProHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		request.setCharacterEncoding("utf-8");
		
		BoardDto boardDto = new BoardDto();
		boardDto.setNum(Integer.parseInt(request.getParameter("num")));
		boardDto.setSubject(request.getParameter("subject"));
		boardDto.setContent(request.getParameter("content"));
		boardDto.setPasswd(request.getParameter("passwd"));
		
		String pageNum = request.getParameter("pageNum");
	
		BoardDao boardDao = BoardDao.getInstance();
		int result = boardDao.modifyArticle(boardDto);
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "/board/modifyPro.jsp";
	}
}
