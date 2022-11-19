package kr.carbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.carbook.service.UserService;

@RestController
public class RestApiController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("user/checkUserIdExist/{id}")
	public String checkUserIdExist(@PathVariable String id) {
		
		System.out.println("RestApiController's id : " + id);
		boolean chk = userService.checkUserIdExist(id);		
		System.out.println("RestApiController's chk : " + chk);
		return chk + "";
		
	}
	
}
