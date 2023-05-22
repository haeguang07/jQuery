package com.yedam.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.yedam.common.DataSource;
import com.yedam.notice.domain.NoticeVO;
import com.yedam.notice.domain.ReplyVO;
import com.yedam.notice.mapper.NoticeMapper;
import com.yedam.notice.service.ReplyService;
import com.yedam.notice.service.ReplyServiceImpl;


public class SampleExe3 {

	public static void main(String[] args) {
	
		SqlSessionFactory sqlSessionFactory = DataSource.getInstance();
		try (SqlSession session = sqlSessionFactory.openSession(true)) {
			NoticeMapper mapper = session.getMapper(NoticeMapper.class);
			List<NoticeVO> list=mapper.noticeWithPage(1);
			for (NoticeVO vo :list) {
				System.out.println(vo);
			}
			
		
		}
		ReplyService service = new ReplyServiceImpl();
		List<ReplyVO> list = service.getReplies(100);
		for(ReplyVO vo : list) {
			System.out.println(vo);
		}
		
		
		
		
	}
	
	
	
	
	
	
	
	
	

}
