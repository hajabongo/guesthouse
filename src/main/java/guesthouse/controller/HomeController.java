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
	
	@RequestMapping("/information")
	public String information() {
		return "information";
	}
	
	@RequestMapping("/recreation")
	public String recreation() {
		return "recreation";
	}
	
	@RequestMapping("/restaurant")
	public String restaurant() {
		return "restaurant";
	}
}
