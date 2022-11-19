package kr.carbook.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.carbook.beans.MemberBean;



public class InjectionInterceptor implements HandlerInterceptor{
	
	private MemberBean loginUserBean;
	
	// 생성자를 통한 주입
	public InjectionInterceptor(MemberBean loginUserBean) {
		super();
		this.loginUserBean = loginUserBean;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		request.setAttribute("loginUserBean", loginUserBean);
		return true;
	}

	

	
	
	
	
}
