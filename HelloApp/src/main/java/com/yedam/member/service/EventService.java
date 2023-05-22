package com.yedam.member.service;

import java.util.List;

import com.yedam.member.domain.EventVO;

public interface EventService {
	public List<EventVO> eventList();
	public boolean addEvent(EventVO vo);
	public boolean removeEvent(EventVO vo);
}
