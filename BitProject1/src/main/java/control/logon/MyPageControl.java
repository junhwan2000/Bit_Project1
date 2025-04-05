package control.logon;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping( "/logonpage" )
public class MyPageControl {
	@GetMapping
	public String logonPage( ) {		
		return "member/mypageForm";
	}
}
