package kr.carbook.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.carbook.beans.MemberBean;

// 사용자가 추가하는 유효성 검사 구현 클래스
public class UserValidator implements Validator{
	
	
	// 유효성 검사할 클래스 지정
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberBean.class.isAssignableFrom(clazz);
	}
	
	// 유효성 검사 구현부
	@Override
	public void validate(Object target, Errors errors) {
		MemberBean userBean = (MemberBean)target;
		
		String beanName = errors.getObjectName();
		System.out.println("beanName" + beanName);
		
		if(beanName.equals("joinUserBean")) {
			if(userBean.getPw().equals(userBean.getPw2()) == false) {
				errors.rejectValue("pw", "NotEquals");
				errors.rejectValue("pw2", "NotEquals");
			}
			
			if(userBean.isUserIdExist() == false) {
				errors.rejectValue("id", "DontCheckUserIdExist");
			}
			
		}// out if
		
		
	}
	
	
	

}
