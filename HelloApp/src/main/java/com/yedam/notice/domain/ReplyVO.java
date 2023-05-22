package com.yedam.notice.domain;

import java.util.Date;

import lombok.Data;
@Data
public class ReplyVO {
//	reply_id number primary key,
//	notice_id number not null,
//	reply varchar2(1000) not null,--댓글 내용
//	reply_writer varchar2(50) not null,
//	reply_date date default sysdate
	
	private int replyId;
	private int noticeId;
	private String reply;
	private String replyWriter;
	private Date replyDate;
}
