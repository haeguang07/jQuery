package com.yedam.member.mapper;

import java.util.List;

import com.yedam.member.domain.EventVO;

public interface EventMapper {
	public List<EventVO> eventList(); 
	public int insertEvent(EventVO vo);
	public int deleteEvent(EventVO vo);
	
}
