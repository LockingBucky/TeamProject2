package kr.carbook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/carView")
public class CarViewController {
	

	@GetMapping("/carViewEX1")
	public String carViewEX1() {
		return "carView/carViewEX1";
	}
	
	@GetMapping("/carViewEX2")
	public String carViewEX2() {
		return "carView/carViewEX2";
	}
	
	@GetMapping("/carViewEX3")
	public String carViewEX3() {
		return "carView/carViewEX3";
	}
	
	@GetMapping("/carViewEX4")
	public String carViewEX4() {
		return "carView/carViewEX4";
	}
	

}
