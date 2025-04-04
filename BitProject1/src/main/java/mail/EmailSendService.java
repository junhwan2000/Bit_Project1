package mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
@Controller

@RequestMapping("/sendmail")
public class EmailSendService {

	
	/*@PostMapping
	public String sendEmail() {

		System.out.println("Mail Sent Successfully...");
		return "dddd";
	}*/
	@Autowired
	private JavaMailSender mailSender;
	
	private static String key;
	public void RandomKey(){
		key = Integer.toString( (int) Math.floor(Math.random()*90000));
	}
	
	@PostMapping
    @ResponseBody
	public String sendEmail( @RequestBody String toEmail) {
		RandomKey();
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			message.setFrom("socialquizwebsite@gmail.com");
			message.setRecipients(MimeMessage.RecipientType.TO, toEmail);
			message.setSubject("소셜 퀴즈 웹사이트 이메일 인증");
			String text = "";
			text += "<h1>"+"인증코드 : "+"</h1>";
			text += key;
			System.out.println(key);
			message.setText(text,"UTF-8","html");
			
			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		System.out.println("Mail Sent Successfully...");
		
		return key;
	}
	
}
