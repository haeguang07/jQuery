package com.yedam.member.mapper;


import java.util.List;
import java.util.Map;

import com.yedam.member.domain.MemberVO;

public interface MemberMapper {
	//로그인체크
	public MemberVO loginCheck(MemberVO vo);
	//회원정보수정
	public int updateMember(MemberVO vo);
	
	public List<Map<String, Object>> memberBydpt(); 
}
