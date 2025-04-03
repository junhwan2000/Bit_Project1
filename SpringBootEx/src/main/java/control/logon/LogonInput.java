package control.logon;

import java.sql.Timestamp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.annotation.Resource;
import logon.LogonDBBean;
import logon.LogonDataBean;

@Controller
@RequestMapping( "/logoninput" )
public class LogonInput {
	@Resource
	private LogonDBBean logonDao;
	
	@GetMapping
	public String inputForm() throws Exception {
		return "member/inputForm";
	}
	@PostMapping
	public String inputPro( @ModelAttribute LogonDataBean logonDto, @RequestParam String user_id,
			@RequestParam String nickname, @RequestParam String email, Model model ) throws Exception {
		
		logonDto.setEmail( email );
		 int checkid = logonDao.check(user_id);
		 int checknickname = logonDao.checkNickname(nickname);
		 int checkemail = logonDao.checkEmail(email);
		    if (checkid == 1) {  
		    	model.addAttribute("result", 2);
		    } else if (checknickname == 1) {
		    	model.addAttribute("result", 3);
		    } else if (checkemail == 1){
		    	model.addAttribute("result", 4);
		    } else {
		        int result = logonDao.insertMember(logonDto);
		        model.addAttribute("result", result);
		    }
		        return "member/inputPro";
		    
		}
} 