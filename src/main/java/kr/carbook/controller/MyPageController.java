package kr.carbook.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.carbook.beans.CardBean;
import kr.carbook.beans.MemberBean;
import kr.carbook.beans.ReserveBean;
import kr.carbook.service.CardService;
import kr.carbook.service.MemberService;
import kr.carbook.service.UserService;



@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private CardService cardService;

	@Resource(name = "loginUserBean")
	private MemberBean loginUserBean;
	
	// 진혁 업데이트 2022.11.17
		// 진혁 업데이트 2022.11.17

		@Autowired
		private UserService userService;

		@GetMapping("/myPage")
		public String myPage() {

			return "myPage/myPage";
		}

		// 예약,예약취소,예약완료 리스트 확인
		@GetMapping("/myReserve")
		public String myPageMyReserve(@RequestParam("id") String id, Model model) {

			List<ReserveBean> myPage = userService.getReserveList(id);
			

			model.addAttribute("loginUserBean", loginUserBean);
			model.addAttribute("myPage", myPage);// 글쓴 회원의 정보
			model.addAttribute("id", id);

			return "myPage/myReserve";
		}
		
		// 결제 기록 페이지
		@GetMapping("/myPayment_history")
		public String payment_history(@RequestParam("rent_seq") int rent_seq, Model model) {

			ReserveBean myReserve = userService.getMyPaymentHistory(rent_seq);
			System.out.println("myPayment_history : " + myReserve.getRent_seq());

			model.addAttribute("rent_seq", rent_seq);
			model.addAttribute("myReserve", myReserve);

			return "myPage/myPayment_history";

		}

		// 예약 삭제
		@GetMapping("/delete")
		public String delete_payment_history(@RequestParam("rent_seq") int rent_seq,
				 Model model) {

			System.out.println("delete page rent_seq : " + rent_seq);
//			System.out.println(coupon_member_seq);
			// 예약에 관한 삭제 3테이블 ※Reference 순서상 Payment -> Rent -> CouponMember 테이블 순으로 삭제가능

			userService.deletePaymentHistoryRent(rent_seq);
//			userService.deletePaymentHistoryCouponMember(coupon_member_seq);

			model.addAttribute("rent_seq", rent_seq);


			return "myPage/HistoryDelete";

		}

		// 쿠폰 페이지
		@GetMapping("/myVip_coupon")
		public String myVip_coupon(@RequestParam("id") String id, Model model) {

			List<ReserveBean> myCoupon = userService.getCouponList(id);

			model.addAttribute("myCoupon", myCoupon);

			return "myPage/myVip_coupon";
		}

		
		// 진혁 업데이트 2022.11.17
		// 진혁 업데이트 2022.11.17


	
	
		// ==================================== 이우철 ===============================================

		
				// 마이페이지 개인정보
				@GetMapping("/modifyInfo/modify")
				public String modify(@ModelAttribute("modifyUserBean") MemberBean modifyUserBean, Model model) {
					
					List<CardBean> cardList = cardService.getCardListInfo(loginUserBean.getId());
					
					memberService.getMemberBeanInfo(modifyUserBean);
					model.addAttribute("cardList", cardList);

					return "myPage/modifyInfo/modify";
				}
				
				// 회원정보 수정
				@PostMapping("/modifyInfo/modify_pro")
				public String modify_pro(@Valid
										 @ModelAttribute("modifyUserBean") MemberBean modifyUserBean, BindingResult result) {
					 
					if(result.hasErrors()) {
						
						return "myPage/modifyInfo/modify";
					}
					memberService.modifyUserInfo(modifyUserBean); // update
					
					return "myPage/modifyInfo/modify_success";
				}
				
				@GetMapping("/register/license")
				public String license(@ModelAttribute("registerLicenseBean") MemberBean licenseBean) {
					return "myPage/register/license";
				}
				
				// 면허증 등록
				@PostMapping("/register/license_pro")
				public String license_pro(@Valid
										  @ModelAttribute("registerLicenseBean") MemberBean licenseBean, BindingResult result) {
					
					
					if(result.hasErrors()) {
						
						return "myPage/register/license";
					}
					memberService.registerLicenseInfo(licenseBean); // update
					
					return "myPage/register/license_success";
				}
				
				@GetMapping("/register/card")
				public String card(@ModelAttribute("registerCardBean") CardBean cardBean, Model model) {
					cardService.getId(cardBean);
					model.addAttribute("cardBean", cardBean);
					return "myPage/register/card";
				}
				
				// 결제카드 등록하기
				@PostMapping("/register/register_card")
				public String register_card(@Valid
									   		@ModelAttribute("registerCardBean") CardBean cardBean, BindingResult result) {
					if(result.hasErrors()) {
						
						return "myPage/register/card";
					}
					cardService.registerCardInfo(cardBean); // insert
					
					return "myPage/register/card_success";
				}
				// 결제카드 정보 등록해제  ** 수정했음 2022-11-15 오후 5:29 **
//				@PostMapping("/register/card_deleted")
//				public String delete_card(@ModelAttribute("registerCardBean") CardBean cardBean) {
//					
//					cardService.deleteCardInfo(cardBean.getId()); // delete
//					
//					return "myPage/register/card_deleted";
//				}

				// ============================================ 이우철 ========================================
	
	

}
