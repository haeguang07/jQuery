package com.yedam.notice.domain;

import java.util.Date;

import lombok.Data;
@Data
public class NoticeVO {
//	notice_id NUMBER PRIMARY KEY,
//	notice_writer VARCHAR2(50) not null,
//	notice_title VARCHAR2(300) not null,
//	notice_subject VARCHAR2(1000) not null,
//	notice_date DATE default SYSDATE,
//	hit_count NUMBER default 0 ,
//	attach_file VARCHAR2(200) 
	private int noticeId;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeSubject;
	private Date noticeDate;
	private int hitCount;
	private String attachFile;
	
	
	
	
	
}
