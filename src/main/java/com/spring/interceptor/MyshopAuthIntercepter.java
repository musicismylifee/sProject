package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MyshopAuthIntercepter extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		    throws Exception {
		
		HttpSession session = request.getSession();
		
		String svo = String.valueOf(session.getAttribute("svo"));  
		if(svo == null) {

			response.sendRedirect("http://localhost:9000/myshop/login.do");
			return false;
		}
			return true;
		}
}
