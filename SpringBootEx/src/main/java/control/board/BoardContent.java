package control.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.BoardDBBean;
import board.BoardDataBean;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping( "/boardcontent" )
public class BoardContent {
	@Resource
	private BoardDBBean boardDao;
	
	@GetMapping
	public String boardContent( @RequestParam int num, @RequestParam String pageNum, 
		@RequestParam int number, HttpServletRequest request, Model model ) throws Exception {
		BoardDataBean boardDto = boardDao.getArticle( num );
		if( ! boardDto.getIp().equals( request.getRemoteAddr() ) )
			boardDao.addCount( num );
		model.addAttribute( "num", num );
		model.addAttribute( "pageNum", pageNum );
		model.addAttribute( "number", number );
		model.addAttribute( "boardDto", boardDto );
		return "board/content";
	}
}
