package com.yedam.notice.mapper;

import java.util.List;

import com.yedam.domain.Employee;
import com.yedam.notice.domain.NoticeVO;

public interface NoticeMapper {
	public Employee getEmp(int empId);

	public List<Employee> empList();

	public int delEmp(int empInt);

	public int addEmp(Employee emp);
	//공지사항CRUD: 입력,조회, 수정, 삭제,목록
	public List<NoticeVO> noticeList();
	public int insertNotice(NoticeVO vo);
	public int updateNotice(NoticeVO vo);
	public int updateNoticeFile(NoticeVO vo);//파일만 바꾸기
	
	public int deleteNotice(int noticeId);
	public NoticeVO searchNotice(int noticeId);
	//조회수 증가
	public int updateCount(int noticeId);
	//공지사항 페이지징
	public List<NoticeVO> noticeWithPage(int page);
	//공지사항 총갯수
	public int getCount();
}
