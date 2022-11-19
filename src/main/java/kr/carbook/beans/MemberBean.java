package kr.carbook.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter 
@Setter
public class MemberBean {
	
	// 아이디
	@Size(min=4, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String id;
	
	// 이름
	@Size(min=2, max=4)
	@Pattern(regexp = "[가-힣]*")
	private String name;
	
	// 비밀번호, 비밀번호 확인
	@Size(min=4, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String pw;
	@Size(min=4, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String pw2;
	
	// 휴대전화
	@Size(min = 13, max = 13)
	@Pattern(regexp = "^010-\\d{4}-\\d{4}")
	private String phone;
	
	// 이메일
	@Pattern(regexp = "^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$")
	private String email;
	
	// 주소
	@Size(max = 50)
	//@Pattern(regexp = "^[가-힣0-9]*")
	private String address;  
	private String  detailAddress;

   // 생일
   @Size(min = 8, max = 8)
   @Pattern(regexp = "[0-9]*")
   private String birth;
	
	// 면허 종류 
	@Size(max = 4)
	@Pattern(regexp = "[0-9][가-힣]*")
	private String license_type;
	
	// 면허증 번호
	@Size(max = 10)
	@Pattern(regexp = "[0-9]*")
	private String license_num;
	
	// 면허증 발급일
	@Size(max = 8)
	@Pattern(regexp = "[0-9]*")
	private String license_start;
	
	// 면허증 갱신기간 만료일
	@Size(max = 8)
	@Pattern(regexp = "[0-9]*")
	private String license_end;
	
 
	

	
	private boolean userIdExist;
	
	private boolean userLogin;
	
	public MemberBean() {
		this.userIdExist = false;
		this.userLogin = false;
	}
	
}
