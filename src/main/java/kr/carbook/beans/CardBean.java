package kr.carbook.beans;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CardBean {
	
	// 은행이름
	@NotBlank
	private String card_name;
	
	// 카드번호
	@Pattern(regexp = "\\d{4}-\\d{4}-\\d{4}-\\d{4}")
	private String card_num;
	
	// 카드 비밀번호
	@Size(min=4, max=4)
	@Pattern(regexp = "[0-9]*")
	private String card_pw;
	
	// 카드 유효기간 (월)
	@Size(min=2, max=2)
	@Pattern(regexp = "[0-9]*")
	private String card_month;
	
	// 카드 유효기간 (년)
	@Size(min=2, max=2)
	@Pattern(regexp = "[0-9]*")
	private String card_year;
	
	// CVC 번호
	@Size(min=3, max=3)
	@Pattern(regexp = "[0-9]*")
	private String business_num;

	// 아이디
	@Size(min=4, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String id;
	
	
}
