package kr.carbook.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.carbook.beans.MemberBean;
import kr.carbook.beans.ReviewBean;
import kr.carbook.service.ReviewService;


@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired 
	private ReviewService reviewService;
	
	@Resource(name = "loginUserBean")
	private MemberBean loginUserBean;
	
	// =============Qustion list=============
	@GetMapping("/services")
	public String services(Model model) {
		
		List<ReviewBean> reviewList = reviewService.getReviewList();
		model.addAttribute("reviewList", reviewList);

		return "review/services";
	}
	
	// ============= write =============
	@GetMapping("/write")
	public String writeReview(@ModelAttribute("writeReviewBean") ReviewBean reviewBean) {
		
		return "review/write";
	}
	
	@PostMapping("/write_pro")
	public String writeProReview(@Valid @ModelAttribute("writeReviewBean") ReviewBean writeReviewBean, BindingResult result) {
		
		if(result.hasErrors()) {
			return "review/write";
		}
		
		reviewService.writeReview(writeReviewBean);
		
		return "review/write_success";
	}
	
	//============= read =============
	
	@GetMapping("/read")
	public String readReview(@RequestParam("review_seq") long review_seq,
							 Model model) {
		
		ReviewBean readReviewBean = reviewService.readReview(review_seq);
		
		
		model.addAttribute("loginUserBean", loginUserBean);
		
		model.addAttribute("readReviewBean", readReviewBean);
		return "review/read";
	}
	
	
	//============= modify =============
	@GetMapping("/modify")
	public String reviewModify(@RequestParam("review_seq") long review_seq,
							   @ModelAttribute("modifyReviewBean") ReviewBean modifyReviewBean, Model model) {
		
		// 게시글 하나의 정보 가져오기
		ReviewBean tempBean = reviewService.readReview(review_seq);
		
		
		
		BeanUtils.copyProperties(tempBean, modifyReviewBean);
		
		
		return "review/modify";
	}
	
	@PostMapping("/modify_pro")
	public String reviewModify_pro(@Valid @ModelAttribute("modifyReviewBean") ReviewBean modifyReviewBean,
			BindingResult result) {

		if (result.hasErrors()) {
			return "review/modify";
		}
		
		reviewService.modifyReview(modifyReviewBean);
		return "review/modify_success";
	}
	
	//============= delete =============
	@GetMapping("/delete")
	public String reviewDelete(@RequestParam("review_seq") long review_seq,  Model model) {

		model.addAttribute("review_seq", review_seq);
		reviewService.deleteReview(review_seq);

		return "review/delete";
	}
}
