package com.yedam.book.domain;

import lombok.Data;

@Data
public class BookVO {
	
//	ISBN          NOT NULL NUMBER         
//	BOOK_NAME     NOT NULL VARCHAR2(100)  
//	BOOK_PRICE    NOT NULL NUMBER         
//	AUTHOR        NOT NULL VARCHAR2(100)  
//	PUBLISHER     NOT NULL VARCHAR2(100)  
//	BOOK_CATEGORY NOT NULL VARCHAR2(100)  
//	BOOK_DETAIL   NOT NULL VARCHAR2(1000) 
//	BOOK_COUNT             NUMBER         
//	HITCOUNT               NUMBER         
//	BOOK_STOCK             NUMBER         
//	COVER                  VARCHAR2(100)  
	private int isbn;
	private String bookName;
	private int bookPrice;
	private String author;
	private String publisher;
	private String bookCategory;
	private String bookDetail;
	private int bookCount;//판매량
	private int hitCount;//조회수
	private int bookStock;
	private String cover;
	
	
}
