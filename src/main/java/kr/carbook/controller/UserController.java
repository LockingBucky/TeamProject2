package kr.carbook.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.carbook.beans.MemberBean;
import kr.carbook.service.UserService;
import kr.carbook.validator.UserValidator;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Resource(name="loginUserBean")
	private MemberBean loginUserBean;
	
	// ---------- 회원 가입 ----------
	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserBean") MemberBean joinUserBean) {	
		return "user/join";
	}
	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinUserBean") MemberBean joinUserBean, BindingResult result) {
		
		if(result.hasErrors()) {
			return "user/join";
		}
		
		userService.addUserInfo(joinUserBean);
        //-진혁- 회원가입할때 같이 동시에 만들어지는 기념 무료 쿠폰추가
        //↓ 회원가입은 각 아이디에 단 한번만 할수 있기때문에 1회성으로 사용되는 메서드
	    userService.addWelcomeCoupon(joinUserBean.getId());
		
		return "user/join_success";
	}
	
	//==============================희원=================================== 
	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginUserBean") MemberBean  tempLoginUserBean, 
			            @RequestParam(value="fail", defaultValue = "false") boolean fail, Model model) {
		
		model.addAttribute("fail", fail); //실패 아니야
		return "user/login";
	}
	
	@PostMapping("/login_pro")
	public String tempLoginUserBean(@Valid @ModelAttribute("tempLoginUserBean") MemberBean tempLoginUserBean,
			BindingResult result) {

		if (result.hasErrors()) {
			return "user/login";
		}

		userService.getLoginUserInfo(tempLoginUserBean);

		if (loginUserBean.isUserLogin() == true) {
			return "user/login_success";
		} else {
			return "user/login_fail"; // 아이디와 비번 검증
		}

	}
	
	@GetMapping("/logout")
	public String logout() {	
		loginUserBean.setUserLogin(false);
		return "user/logout";
	}
		
	@GetMapping("/not_login")
	public String not_login() {	
		return "user/not_login";
	}
	
	
	//UserValidator 요청
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserValidator validator1 = new UserValidator();
		binder.addValidators(validator1);
	}
	
}
