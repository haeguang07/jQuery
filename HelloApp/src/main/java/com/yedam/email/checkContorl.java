package com.yedam.email;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class checkContorl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String random= req.getParameter("certification");
		if(random.equals(req.getAttribute(random))) {
			return "main.do";
		}else {
			return "emailForm.do";
		}
	}

}
