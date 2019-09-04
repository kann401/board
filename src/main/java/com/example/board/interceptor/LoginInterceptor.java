package com.example.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//로그인 인터셉터
public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//세션 객체 생성
		HttpSession session = request.getSession();
		//세션 변수 검사
		if(session.getAttribute("userid") == null) {
			//세션이 없으면 로그인 페이지로 이동
			response.sendRedirect(
					//admin으로 일단 쓰고있다.
		request.getContextPath()+"/admin/login.do?message=nologin");
			return false; //계속 진행하지 않음
		} else {
			return true;
		}
	}
}
