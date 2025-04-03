package control.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.BoardDBBean;
import jakarta.annotation.Resource;

@Controller
@RequestMapping( "/boarddelete" )
public class BoardDelete {
	@Resource
	private BoardDBBean boardDao;
	
	@GetMapping
	public String deleteForm( @RequestParam int num, @RequestParam String pageNum, 
		Model model ) throws Exception {			
		model.addAttribute( "num", num );
		model.addAttribute( "pageNum", pageNum );
		return "board/deleteForm";
	}
	@PostMapping
	public String deletePro( @RequestParam int num, @RequestParam String passwd,
		@RequestParam String pageNum, Model model ) throws Exception {			
		int resultCheck = boardDao.check( num, passwd );
		model.addAttribute( "num", num );
		model.addAttribute( "pageNum", pageNum );
		model.addAttribute( "resultCheck", resultCheck );			
		if( resultCheck == 1 ) {
			int result = boardDao.deleteArticle( num );
			model.addAttribute( "result", result );
		}			
		return "board/deletePro";
	}
}





