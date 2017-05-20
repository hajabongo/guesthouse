package guesthouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@RequestMapping
	public String welcome() {
		return "home";
	}
	
	@RequestMapping("/test")
	public String test(Model model) {
		model.addAttribute("tytul", "Witaj w \"nazwa pensjonatu\"");
		model.addAttribute("podtytul", "Wyj�tkowym i jedynym miejscu w \"nazwa miasta\"");
		return "index";
	}
}
