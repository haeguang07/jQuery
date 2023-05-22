package com.yedam.chart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.member.domain.EventVO;
import com.yedam.member.service.EventService;
import com.yedam.member.service.EventServiceImpl;

public class EventListContorl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EventService service= new EventServiceImpl();
		List<EventVO> list=service.eventList();
		
		Gson gson= new GsonBuilder().create();
		
		String json="";
		
		json= gson.toJson(list);
		
		return json+".json";
	}

}
