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
import com.yedam.notice.domain.ReplyVO;
import com.yedam.notice.service.ReplyService;
import com.yedam.notice.service.ReplyServiceImpl;

public class modifyReplyContorl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReplyService service = new ReplyServiceImpl();
		String rid =req.getParameter("rid");
		String reply = req.getParameter("reply");
		//update
		boolean result=service.modifyReply(Integer.parseInt(rid), reply); 
		//search
		String json ="";
		Map<String, Object> map =new HashMap<>();
		if(result) {
			map.put("retCode", "Success");
			ReplyVO vo = service.getReply(Integer.parseInt(rid));
			map.put("data", vo);
		}else {
			map.put("retCode", "Fail");
		}
		Gson gson =new GsonBuilder().create();
		json=gson.toJson(map);
		return json +".json";
	}

}
