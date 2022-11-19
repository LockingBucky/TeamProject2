package kr.carbook.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.carbook.beans.CarBean;
import kr.carbook.beans.CardBean;
import kr.carbook.beans.CouponBean;
import kr.carbook.beans.MemberBean;
import kr.carbook.beans.RentBean;
import kr.carbook.service.CardService;
import kr.carbook.service.CouponService;
import kr.carbook.service.RentService;
import kr.carbook.service.UserService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	RentService rentService;
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	CardService cardService;
	
	@Autowired
	UserService userService;
	
	@Resource(name = "loginUserBean")
	private MemberBean loginUserBean;
	
	@GetMapping("/pricing")
	public String pricing() {
		return "order/pricing";
	}
	
	@GetMapping("/car")
	public String car() {
		return "order/car";
	}
	
	@PostMapping("/payment")
	public String payment(@RequestParam("car_seq") int car_seq,
						  @ModelAttribute("select_RentBean") RentBean select_RentBean,
						  Model model) throws ParseException {
		
		CarBean carInfo=rentService.getCarInfo(car_seq);
		System.out.println("loginUserBean : " + loginUserBean.getId());
		CouponBean couponBean = couponService.getCoupon(loginUserBean.getId());
		
		System.out.println("couponBean : " + couponBean.getCoupon_name());
		
		int day = calcDay(select_RentBean.getStartDate(), select_RentBean.getEndDate());
		System.out.println("day : " + day);
		
		int total = carInfo.getPrice() * day;
		
		select_RentBean.setCar_seq(car_seq);
		select_RentBean.setId(loginUserBean.getId());
		
		
		
		model.addAttribute("couponName", couponBean.getCoupon_name());
		model.addAttribute("couponPrice", couponBean.getCoupon_price());
		//model.addAttribute("cardNum", cardNum);		
		model.addAttribute("total", total);		
		
		return "order/payment";
	}
	
	@PostMapping("/payment_success")
	public String payment_success(@RequestParam("total") int total,
								  @RequestParam("couponPrice") int couponPrice,
								  @ModelAttribute("select_RentBean") RentBean select_RentBean) throws ParseException {
		
		Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(select_RentBean.getStartDate());
        Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(select_RentBean.getEndDate());
		
        select_RentBean.setStart(format1);
        select_RentBean.setEnd(format2);
        
		if(select_RentBean.isCheckCoupon() == true) {
			int price = total - couponPrice;
			select_RentBean.setPrice(price);
			userService.deletePaymentHistoryPayment(loginUserBean.getId());
			System.out.println("true : ");
			rentService.addRentInfo(select_RentBean);
		} else {
			System.out.println("false : ");
			rentService.addRentInfo(select_RentBean);
		}
			
		return "order/payment_success";
	}
	
	
	int calcDay(String startDate, String endDate) throws ParseException {
		
		Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
        Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
        
        int diffSec = (int)(format1.getTime() - format2.getTime()) / 1000; 
        int diffDays = diffSec / (24*60*60); 
		
        return diffDays;
	}
	

}
