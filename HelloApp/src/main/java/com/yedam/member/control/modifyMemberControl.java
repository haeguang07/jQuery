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

public class modifyMemberControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service =new MemberServiceImpl();
	
		MemberVO vo = new MemberVO();
		vo.setEmail(req.getParameter("email")); 
		vo.setPassword(req.getParameter("pass")); 
		vo.setAddress(req.getParameter("address")); 
		vo.setPhone(req.getParameter("phone")); 
		System.out.println(vo);
		if(service.modifyMember(vo)) {
			vo = service.loginCheck(vo);
			HttpSession session = req.getSession();
			
			session.setAttribute("memberInfo", vo);
			return "noticeList.do";
		}else {
			return "modifyMemberForm.do";
		}
		
		
	}

}
