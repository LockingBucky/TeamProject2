package kr.carbook.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.carbook.beans.MemberBean;

public class CheckLoginInterceptor implements HandlerInterceptor{
	
	// 로그인 여부를 판단하는 loginUserBean
	private MemberBean loginUserBean;
	
	public CheckLoginInterceptor(MemberBean loginUserBean) {
		this.loginUserBean = loginUserBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(loginUserBean.isUserLogin() == false) {
			// 로그인 하지 않은 상태에서의 경로 추출
			String contextPath = request.getContextPath();
			// 로그인이 되지 않았으므로 웹브라우저에게 not_login을 요청하라고 구현
			response.sendRedirect(contextPath + "/user/not_login");
			// 흐름 중단 다음 단계로 이동
			return false;
		}
		return true;
	}
}
