package handler.board;

import java.util.List;

import dao.BoardDao;
import dto.BoardDto;
import handler.CommandHandler;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardListHandler implements CommandHandler{
@Override
public String process(HttpServletRequest request, HttpServletResponse response)	
		throws Exception {

	int count = 0;				// 전체 글 개수
	String pageNum = null;		// 넘겨받은 페이지 번호
	int currentPage = 0;		// 계산용 페이지 번호
	int start = 0;				// 출력할 페이지 첫 DB index
	int end = 0;				// 출력할 페이지 마지막 DB index	
	int number = 0;				// 출력용 글번호
	int pageCount = 0;			// 페이지 개수
	int startPage = 0;			// 출력할 페이지 시작 번호
	int endPage = 0;			// 출력할 페이지 끝 번호
	int pageSize = 10;			// 한페이지에 뜨는 글 개수 
	int pageBlock = 5;			// 
	
	BoardDao boardDao = BoardDao.getInstance();
	count = boardDao.getCount();
	
	pageNum = request.getParameter( "pageNum" );
	if( pageNum == null || pageNum.equals( "" ) ) {
		// 첫 페이지를 보겠다는 의미
		pageNum = "1";
	}
	currentPage = Integer.parseInt( pageNum );
	start = ( currentPage - 1 ) * pageSize + 1;		// ( 5 - 1 ) * 10 + 1		41
	end = start + pageSize - 1;						// 41 + 10 - 1				50
	if( end > count ) {
		// 계산보다 실제 글이 적은 경우
		end = count;
	}
	
	number = count - ( currentPage - 1 ) * pageSize;// 50 - ( 1 - 1 ) * 10 		50 
	
	pageCount = ( count / pageSize ) + ( count % pageSize > 0 ? 1 : 0 );	
	startPage = ( currentPage / pageBlock ) * pageBlock + 1;	
	if( currentPage % pageBlock == 0 )
		startPage -= pageBlock;
	endPage = startPage + pageBlock - 1;
	if( endPage > pageCount )
		endPage = pageCount;
	
	request.setAttribute("pageBlock", pageBlock);
	request.setAttribute("count", count);
	request.setAttribute("number", number);
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("pageCount", pageCount);
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage", endPage);
	
	if (count>0) {
		List<BoardDto> dtos = boardDao.getArticles(start, end);
		request.setAttribute("dtos", dtos);
	}
	
		return "/board/list.jsp";
	}
}
