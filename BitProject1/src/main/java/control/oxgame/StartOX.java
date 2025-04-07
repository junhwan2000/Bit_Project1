package control.oxgame;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("quiz/startox")
public class StartOX {
	@GetMapping
	public String play() {
		return "quiz/oxGame/oxForm";
	}

}
