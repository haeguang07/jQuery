package com.yedam.common;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter

public class PageDTO {
	//현재페이지:5
	//시작페이지:1
	//마지막페이지: 10(마지막페이지가 10미만이면 그페이지까지만 보이게)
	private int startPage;//현재페이지 기준 첫 페이지
	private int endPage;
	private boolean prev ;
	private boolean next;
	private int  pageNum;
	
	
	public PageDTO(int pageNum, int total) {
		this.pageNum= pageNum;
		
		
		this.endPage=(int) Math.ceil(this.pageNum/10.0)*10;
		this.startPage =this.endPage-9;
		int realEnd = (int) (Math.ceil(total/10.0));
		
		if(realEnd<this.endPage) {
			this.endPage=realEnd;
		}
		this.prev = this.startPage>1;
		this.next = this.endPage<realEnd;
	}
}
