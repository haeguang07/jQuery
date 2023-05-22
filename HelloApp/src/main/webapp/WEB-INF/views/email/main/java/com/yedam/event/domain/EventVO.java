package com.yedam.event.domain;

import java.util.Date;

import lombok.Data;
@Data
public class EventVO {
//	USER_ID    NOT NULL VARCHAR2(16) 
//	EVENT_DATE NOT NULL DATE  
	
	private String userId;
	private Date eventeDate;
}
