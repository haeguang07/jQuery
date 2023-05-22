package com.yedam.notice.contorl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

public class NoticeListJsonControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NoticeService service = new NoticeServieImpl();
		List<NoticeVO> list=service.noticeListJson();
		
		
		Gson gson = new GsonBuilder().create();
		String json= gson.toJson(list);
		
		return json+".json";
	}

}
