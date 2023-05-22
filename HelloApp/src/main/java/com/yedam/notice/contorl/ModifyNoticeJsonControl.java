package com.yedam.notice.contorl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServieImpl;

public class ModifyNoticeJsonControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String subject = req.getParameter("subject");
		String title = req.getParameter("title");
		String idStr = req.getParameter("id");
		int id =Integer.parseInt(idStr);

		
		
		NoticeVO vo = new NoticeVO();
		vo.setNoticeId(id);
		vo.setNoticeTitle(title);
		vo.setNoticeSubject(subject);
		NoticeService service= new NoticeServieImpl();
		Map<String,Object> map = new HashMap<>();
		if(service.modifyNotice(vo)) {
			vo = service.getNotice(id);
			map.put("vo", vo);
			map.put("retCode", "Success");
		}else {
			map.put("retCode", "Fail");			
		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);
		return json+".json";			
	}

}
