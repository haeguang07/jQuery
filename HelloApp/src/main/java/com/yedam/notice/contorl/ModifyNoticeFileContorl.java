package com.yedam.notice.contorl;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServieImpl;

public class ModifyNoticeFileContorl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir = req.getServletContext().getRealPath("images");
		int maxSize = 5 * 1024 * 1024;
		String encoding = "UTF-8";
		DefaultFileRenamePolicy rn = new DefaultFileRenamePolicy();
		MultipartRequest multi = new MultipartRequest(req, saveDir, maxSize, encoding, rn);
		
		String nid = multi.getParameter("nid");
		int noticeId = Integer.parseInt(nid);
		String attach ="";
	    Enumeration<?> enu = multi.getFileNames();
	    while (enu.hasMoreElements()) {
	        String file = (String) enu.nextElement();
	        System.out.println("file : " + file);
	        attach= multi.getOriginalFileName(file);
	    }		
		
		NoticeVO vo = new NoticeVO();
		vo.setNoticeId(noticeId);
		vo.setAttachFile(attach);
		NoticeService service = new NoticeServieImpl();
		Map<String,Object> map = new HashMap<>();
		if(service.modifyNoticeFile(vo)) {
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
