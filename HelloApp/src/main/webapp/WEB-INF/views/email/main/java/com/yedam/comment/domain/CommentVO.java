package com.yedam.comment.domain;

import java.util.Date;

import lombok.Data;
@Data
public class CommentVO {
//	COMMENT_ID      NOT NULL NUMBER         
//	BOARD_ID        NOT NULL NUMBER         
//	USER_ID         NOT NULL VARCHAR2(16)   
//	COMMENT_SUBJECT NOT NULL VARCHAR2(1000) 
//	COMMENT_DATE    NOT NULL DATE  
	private int commentId;
	private int boardId;
	private String userId;
	private String commentSubject;
	private Date comentDate;
	
}
