package control.board;

import java.sql.Timestamp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.BoardDBBean;
import board.BoardDataBean;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping( "/boardwrite" )
public class BoardWrite {
	@Resource
	private BoardDBBean boardDao;
	
	@GetMapping
	public String writeForm( @RequestParam( defaultValue="0"  ) int num,
		@RequestParam( defaultValue="1" ) int ref, 
		@RequestParam( defaultValue="0"  ) int re_step,
		@RequestParam( defaultValue="0" ) int re_level, Model model ) throws Exception {
		model.addAttribute( "num", num );
		model.addAttribute( "ref", ref );
		model.addAttribute( "re_step", re_step );
		model.addAttribute( "re_level", re_level );
		return "board/writeForm";
	}
	@PostMapping
	public String writePro( @ModelAttribute BoardDataBean boardDto, 
			HttpServletRequest request, Model model ) 
			throws Exception {		
			// 작성일
			boardDto.setReg_date( new Timestamp( System.currentTimeMillis() ) );
			// IP
			boardDto.setIp( request.getRemoteAddr() );		// IPv6	
			int result = boardDao.insertArticle( boardDto );
			model.addAttribute( "result", result );
			
			return "board/writePro";
		}
}
