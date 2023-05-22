package com.yedam.notice.contorl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServieImpl;

public class DelNoticeJsonControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NoticeService service= new NoticeServieImpl();
		String id = req.getParameter("nid");
		int noticeId = id==null? 1: Integer.parseInt(id);
		String json= "Fail";
		if(service.removeNotice(noticeId)) {
			json= "Success";
		}
		
		return json+".json";
	}

}
