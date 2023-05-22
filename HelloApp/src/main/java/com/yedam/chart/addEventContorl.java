package com.yedam.chart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.member.domain.EventVO;
import com.yedam.member.service.EventService;
import com.yedam.member.service.EventServiceImpl;

public class addEventContorl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EventVO vo = new EventVO();
		
		vo.setTitle(req.getParameter("title")); 
		vo.setStartDate(req.getParameter("start"));
		vo.setEndDate(req.getParameter("end"));
		
		EventService service= new EventServiceImpl();
		boolean result= service.addEvent(vo);
		String json ="";
		Map<String, Object> map =new HashMap<>();
		if(result) {
			map.put("retCode", "Success");
		}else {
			map.put("retCode", "Fail");
		}
		Gson gson= new GsonBuilder().create();
		json= gson.toJson(map);
		return json+".json";
	}

}
