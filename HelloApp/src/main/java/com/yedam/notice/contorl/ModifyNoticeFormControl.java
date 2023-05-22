package com.yedam.notice.contorl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServieImpl;

public class ModifyNoticeFormControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nid = req.getParameter("nid");
		NoticeService service =new NoticeServieImpl();
		req.setAttribute("noticeInfo", service.getNotice(Integer.parseInt(nid)));
		
		return "notice/modifyNotice.tiles";
	}

}
