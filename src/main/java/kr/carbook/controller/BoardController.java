package kr.carbook.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class BoardController {
	
	
	@GetMapping("/about")
	public String about() {
		return "about";
	}
	

	
	@GetMapping("/blog")
	public String blog() {
		return "blog";
	}
	

	
	

}
