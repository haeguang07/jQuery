package com.yedam.member.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.domain.MemberVO;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceImpl;

public class loginContorl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//MemberService/ MemberServiceImpl. MemberMapper.java/xml
		//serive: MemberVo vo loginCheck(MemberVo vo)
		//Mapper : MemberVo vo loginCheck(MemberVo vo)
		MemberVO vo = new MemberVO();
		String email = req.getParameter("email");
		String password = req.getParameter("pass");
		vo.setEmail(email);
		vo.setPassword(password);
		MemberService service = new MemberServiceImpl();
		
		vo = service.loginCheck(vo);
		
		if (vo!=null) {
			HttpSession session = req.getSession();
			session.setAttribute("memberInfo", vo);
		
			return "noticeList.do";
		}else {
			return "loginForm.do";			
		}
	}
	

}
