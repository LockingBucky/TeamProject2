package kr.carbook.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.carbook.beans.CarBean;
import kr.carbook.beans.CarOption_Bean;
import kr.carbook.beans.MemberBean;
import kr.carbook.beans.RentBean;
import kr.carbook.service.CardService;
import kr.carbook.service.RentService;
import kr.carbook.service.UserService;

@Controller
@RequestMapping("/order")
public class CarController {

	@Autowired
	RentService rentService;
	
	@Autowired
	UserService userService;
	
	
	@Resource(name = "loginUserBean")
	private MemberBean loginUserBean;

	@GetMapping("/contact")
	public String Contact(@ModelAttribute("select_RentBean") RentBean select_RentBean,Model model) {
		MemberBean Info=rentService.getMember(loginUserBean.getId());
		

		if(userService.getLicenseType() == null) {
			return "order/fail_license";
		}

		
		model.addAttribute("UserInfo",Info);

		return "order/contact";
	}

	// 차량선택
	@PostMapping("/CarSelect_list")
	public String CarSelect_list(@RequestParam("pickup_zone") String pickup_zone,
			@ModelAttribute("select_RentBean") RentBean select_RentBean, Model model,BindingResult contact_result) {

		if (contact_result.hasErrors()) {
			return "order/contact_fail";
		}
		List<CarBean> Cars = rentService.getCars(pickup_zone);
		System.out.println("CarNames :" + Cars);
		model.addAttribute("CarNames", Cars);// 차량정보들
		
		return "order/CarSelect_list";
	}
	
	@PostMapping("/Carselect")
	public String CarSelect(
			@RequestParam("car_seq") int car_seq,
			@ModelAttribute("select_RentBean") RentBean select_RentBean, Model model) {
		
		MemberBean Info=rentService.getMember(loginUserBean.getId());
		model.addAttribute("UserInfo",Info);
		
		CarBean carInfo=rentService.getCarInfo(car_seq);
		model.addAttribute("carInfo",carInfo);
		 
		
		return "order/Carselect";
	}
	
	@PostMapping("/car-single")
	public String carsingle(@RequestParam("car_seq") int car_seq,
			@ModelAttribute("carOption_Bean") CarOption_Bean carOption_Bean, Model model) {
		
		CarOption_Bean Option=rentService.getOption(car_seq);
		model.addAttribute("Option", Option);
		
		return "order/car-single";
	}

	@PostMapping("/Carselect_pro")
	public String CarSelect_pro(@ModelAttribute("select_RentBean") RentBean select_RentBean, BindingResult car_result) {
		if (car_result.hasErrors()) {
			return "order/Carselect";
		}
		rentService.addRentInfo(select_RentBean);

		return "order/Carselect_success";
	}


}
