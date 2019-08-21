package com.guafindel.mm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public  class AuthCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler)
			throws Exception {
		
		//세션에 loginInfo 속성이 존재하면 return true
		
		//현재 요청에서 세션 객체 받기
		HttpSession session = request.getSession(false);
		
		/*
		 * if (session != null) { //세션에서 loginInfo 속성 값을 받아온다. Object authInfo =
		 * session.getAttribute("loginInfo");
		 * 
		 * if (authInfo != null) { return true; } }
		 */
		
		if (session != null && session.getAttribute("logininfo") != null) {
			return true;
		}
		
		response.sendRedirect(request.getContextPath()+"/member/login");
		
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	

	
}
