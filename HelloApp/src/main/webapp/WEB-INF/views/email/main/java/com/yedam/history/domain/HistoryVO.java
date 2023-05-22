package com.yedam.history.domain;

import lombok.Data;

@Data
public class HistoryVO {
//	ORDER_ID      NOT NULL VARCHAR2(100) 
//	ISBN          NOT NULL NUMBER        
//	HISTORY_COUNT NOT NULL NUMBER   
	private String orderId;
	private int isbn;
	private int historyCount;
}
