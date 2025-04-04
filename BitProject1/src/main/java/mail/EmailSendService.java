package mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Service
@Controller
@RequestMapping("mail/sendmail")
public class EmailSendService {
	@Autowired
	private JavaMailSender mailSender;
	
	@PostMapping
	public void sendEmail(@RequestParam String toEmail) {
	
		MakeKeyNumber keynumber = new MakeKeyNumber();
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("socialquizwebsite@gmail.com");
		message.setTo(toEmail);
		message.setText("소셜 퀴즈 웹 사이트 이메일 인증 메일입니다.\n 인증 번호 : " + keynumber.MakeKeyNumber());
		message.setSubject("This is test Email");
		
		mailSender.send(message);
		
		System.out.println("Mail Sent Successfully...");
	}
}
