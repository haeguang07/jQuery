package com.yedam.user.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class loginControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get 방식은 login.jsp
		//post는 로그인 기능, 로그인 정보는 세션에 저장
		if(req.getMethod().equals("GET")){
			return "WEB-INF/views/user/login.jsp";
		}else if(req.getMethod().equals("POST")) {
			req.getParameter("id");
			req.getParameter("pw");
			
		};
		
		
		return null;
	}

}
