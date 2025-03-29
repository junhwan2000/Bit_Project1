package handler.board;

import dao.BoardDao;
import dto.BoardDto;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardContentHandler implements CommandHandler{
@Override
public String process(HttpServletRequest request, HttpServletResponse response) 
throws Exception {
	
	int num = Integer.parseInt( request.getParameter( "num" ) );
	String pageNum = request.getParameter( "pageNum" );
	int number = Integer.parseInt(request.getParameter( "number" ));
	
	BoardDao boardDao = BoardDao.getInstance();
	BoardDto boardDto = boardDao.getArticle( num );
	if (! boardDto.getIp().equals(request.getRemoteAddr()))
		boardDao.addCount(num);
	
	request.setAttribute("num", num);
	request.setAttribute("pageNum",pageNum);
	request.setAttribute("number", number);
	request.setAttribute("boardDto", boardDto);
	
	return "/board/content.jsp";
	}
}
