package handler.board;

import java.sql.Timestamp;

import dao.BoardDao;
import dto.BoardDto;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardWriteProHandler implements CommandHandler {
@Override
public String process(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {
	

	request.setCharacterEncoding("utf-8");
	BoardDto boardDto = new BoardDto();
	boardDto.setNum(Integer.parseInt(request.getParameter("num")));
	boardDto.setWriter(request.getParameter("writer"));
	boardDto.setSubject(request.getParameter("subject"));
	boardDto.setPasswd(request.getParameter("passwd"));
	boardDto.setRef(Integer.parseInt(request.getParameter("ref")));
	boardDto.setContent(request.getParameter("content"));
 	// 작성일
 	boardDto.setReg_date(new Timestamp(System.currentTimeMillis()));
 	// IP
 	boardDto.setIp(request.getRemoteAddr()); // IPv6

 	BoardDao boardDao = BoardDao.getInstance();
 	int result = boardDao.insertArticle(boardDto);

 	request.setAttribute("result", result);
 	
	return "/board/writePro.jsp";
	
	}
}
