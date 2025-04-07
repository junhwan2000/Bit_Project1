package control.wordgame;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("quiz/startword")
public class StartWord {
	@GetMapping
	public String play() {
		return "quiz/wordGame/wordForm";
	}

}
