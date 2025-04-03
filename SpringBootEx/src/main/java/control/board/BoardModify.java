package control.board;

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

@Controller
@RequestMapping
public class BoardModify {
	
	@Resource
	private BoardDBBean boardDao;

	@GetMapping( "/boardmodify" )
	public String modifyForm( @RequestParam int num, @RequestParam String pageNum, 
		Model model ) throws Exception {		
		model.addAttribute( "num", num );
		model.addAttribute( "pageNum", pageNum );
		return "board/modifyForm";
	}
	
	@PostMapping( "/boardmodify" )
	public String modifyView( @RequestParam int num, @RequestParam String pageNum,
		@RequestParam String passwd, Model model ) throws Exception {
		int result = boardDao.check( num, passwd );	
		model.addAttribute( "num", num );
		model.addAttribute( "pageNum", pageNum );
		model.addAttribute( "result", result );		
		if( result == 1 ) {
			BoardDataBean boardDto = boardDao.getArticle( num );
			model.addAttribute( "boardDto", boardDto );
		}		
		return "board/modifyView";
	}
	
	@PostMapping( "/boardmodifypro" )
	public String process( @ModelAttribute BoardDataBean boardDto, 
		@RequestParam String pageNum, Model model ) throws Exception {
		int result = boardDao.modifyArticle( boardDto );
		model.addAttribute( "result", result );
		model.addAttribute( "pageNum", pageNum );		
		return "board/modifyPro";
	}	
}
