package com.yedam.notice.contorl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServieImpl;

public class ModifyNoticeControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NoticeService service =new NoticeServieImpl();
		if(req.getMethod().equals("GET")) {
			String nid = req.getParameter("nid");
			req.setAttribute("noticeInfo", service.getNotice(Integer.parseInt(nid)));
			
			return "notice/modifyNotice.tiles";			
		}else if(req.getMethod().equals("POST")) {
			
			String subject = req.getParameter("subject");
			String title = req.getParameter("title");
			String nid = req.getParameter("nid");
			
			
			NoticeVO vo = new NoticeVO();
			vo.setNoticeId(Integer.parseInt(nid));
			vo.setNoticeTitle(title);
			vo.setNoticeSubject(subject);
			
			if(service.modifyNotice(vo)) {
				return "noticeList.do";
			}else {
				return "main.do";			
			}
		}
		return "noticeAdd.do";		
		
	}

}
