package com.yedam.notice.contorl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.service.NoticeService;
import com.yedam.notice.service.NoticeServieImpl;

public class GetNoticeControl implements Control {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nid = req.getParameter("nid");
		NoticeService service =new NoticeServieImpl();
		NoticeVO vo = service.getNotice(Integer.parseInt(nid));
		req.setAttribute("noticeInfo", vo);
		String page =req.getParameter("page");
		req.setAttribute("pageNum",page);
		
		if(vo.getAttachFile()!=null) {
			String imgPath = req.getServletContext().getRealPath("images");
			Path file =Paths.get(imgPath+"/"+ vo.getAttachFile());
			System.out.println(imgPath);
			String filetype= Files.probeContentType(file);
			req.setAttribute("fileType", filetype.substring(0, filetype.indexOf("/")));
		}
		return "notice/noticeGet.tiles";
	}

}
