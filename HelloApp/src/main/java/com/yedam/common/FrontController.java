package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.chart.EventListContorl;
import com.yedam.chart.FullCalendarContorl;
import com.yedam.chart.addEventContorl;
import com.yedam.chart.chartControl;
import com.yedam.chart.chartDataControl;
import com.yedam.chart.removeEventContorl;
import com.yedam.email.checkContorl;
import com.yedam.email.emailContorl;
import com.yedam.email.emailFormContorl;
import com.yedam.member.control.LoginFormContorl;
import com.yedam.member.control.loginContorl;
import com.yedam.member.control.logoutContorl;
import com.yedam.member.control.modifyMemberControl;
import com.yedam.member.control.modifyMemberFromControl;
import com.yedam.notice.contorl.*;


public class FrontController extends HttpServlet {
	String encoding;
	Map <String , Control> map;
	
	public FrontController() {
		map = new HashMap<>();
	}
	@Override
	public void init(ServletConfig config) throws ServletException {
		encoding = config.getInitParameter("enc");
		//첫페이지
		map.put("/main.do",new MainControl());
		//공지사항
		map.put("/noticeList.do", new NoticeListControl());
		map.put("/noticeListJson.do", new NoticeListJsonControl());//json형태
		//공지사항 등록화면
		map.put("/noticeAddForm.do", new NoticeAddForm());
		map.put("/noticeAddForm2.do", new NoticeAddForm());
		//공지사항 등록 기능
		map.put("/noticeAdd.do", new NoticeAddControl());
		//공지사항 들어가기(상세보기)
		map.put("/getNotice.do", new GetNoticeControl());
		map.put("/getNoticeJson.do", new GetNoticeJsonControl());
		//공지사항 수정하기 화면
		//수정하기 기능
		map.put("/modifyNotice.do", new ModifyNoticeControl());
		map.put("/modifyNoticeJson.do", new ModifyNoticeJsonControl());		
		map.put("/modifyNoticeFile.do", new ModifyNoticeFileContorl());
		//삭제기능
		map.put("/delNoticeJson.do", new DelNoticeJsonControl());
		//회원관련
		//로그인 회면
		map.put("/loginForm.do", new LoginFormContorl());
		//로그인 기능
		map.put("/login.do", new loginContorl());
		//로그아웃 기능
		map.put("/logout.do", new logoutContorl());
		//회원수정화면
		map.put("/modifyMemberForm.do", new modifyMemberFromControl());
		// 회원수정 기능
		map.put("/modifyMember.do", new modifyMemberControl());
		//이메일 전송
		map.put("/emailForm.do", new emailFormContorl());
		map.put("/email.do", new emailContorl());
		map.put("/check.do", new checkContorl());
		
		//댓글 정보
		map.put("/replyList.do", new ReplyListContorl());
		//댓글 추가
		map.put("/addReply.do", new AddReplyContorl());
		//댓글 삭제
		map.put("/removeReply.do", new removeReplyContorl());
		//댓글 수정
		map.put("/modifyReply.do", new modifyReplyContorl());
		//차트생성
		map.put("/chart.do", new chartControl());
		map.put("/chartData.do", new chartDataControl());
		//fullcalendar
		map.put("/fullCalendar.do", new FullCalendarContorl());
		map.put("/eventList.do", new EventListContorl());
		map.put("/addEvent.do", new addEventContorl());
		map.put("/removeEvent.do", new removeEventContorl());
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding(encoding);
		String uri =req.getRequestURI();
		String context= req.getContextPath();
		String path = uri.substring(context.length());
		
		System.out.println(path);
		Control control = map.get(path);
		String viewPage = control.execute(req,resp);
		System.out.println(viewPage);
		if(viewPage.endsWith(".do")) {
			resp.sendRedirect(viewPage);
			return;
		}
		if(viewPage.endsWith(".json")) {
			resp.setContentType("text/json;charset=UTF-8");
			resp.getWriter().print(viewPage.substring(0,viewPage.length()-5));
			
			return;
		}
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
		
	}
	
}
