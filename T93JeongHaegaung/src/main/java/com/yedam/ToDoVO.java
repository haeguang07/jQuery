package com.yedam;

import lombok.Data;

@Data
public class ToDoVO {
	private int todoNo;//번호
	private String todoTitle;//할일
	private String todoStatus;//상태(취소선) 취소는:Y,아니면:N
}
