package control.logon;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpSession;
import logon.LogonDBBean;
import logon.LogonDataBean;

@Controller
@RequestMapping
public class ModifyControl {
	@Resource
	private LogonDBBean logonDao;
	
	@GetMapping( "/logon/modify" )
	public String modifyForm() throws Exception {	
		return "member/modifyForm";
	}
	@PostMapping( "/logonmodify" )
	public String process( HttpSession session, @RequestParam String passwd, Model model ) 
		throws Exception {		
		String user_id = (String) session.getAttribute( "memId" );
		int result = logonDao.check( user_id, passwd );
		model.addAttribute( "result", result );
		System.out.println( result );
		if( result == 1 ) {
			LogonDataBean memberDto = logonDao.getMember( user_id );
			model.addAttribute( "memberDto", memberDto );
		}		
		return "member/modifyView";
	}
	@PostMapping( "/logonmodifypro" )
	public String process( @ModelAttribute LogonDataBean logonDto, 
		
		@RequestParam String email, Model model ) throws Exception {
		logonDto.setEmail( email );	
	
		int result = logonDao.modifyMember( logonDto );	
		
		model.addAttribute( "result", result );
		
		return "member/modifyPro";
	}
	
}




