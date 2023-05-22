package com.yedam.member.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.member.domain.EventVO;
import com.yedam.member.mapper.EventMapper;

public class EventServiceImpl implements EventService {
	SqlSession session = DataSource.getInstance().openSession(true);
	EventMapper mapper = session.getMapper(EventMapper.class);
	@Override
	public List<EventVO> eventList() {
		return mapper.eventList();
	}
	@Override
	public boolean addEvent(EventVO vo) {
		return mapper.insertEvent(vo)==1;
	}
	@Override
	public boolean removeEvent(EventVO vo) {
		return mapper.deleteEvent(vo)>0;
	}

}
