package com.yedam.order.domain;

import java.util.Date;

import lombok.Data;
@Data
public class OrderVO {
//	ORDER_ID      NOT NULL VARCHAR2(100)  
//	USER_ID       NOT NULL VARCHAR2(16)   
//	PAYMENT       NOT NULL NUMBER         
//	ORDER_POINT            NUMBER         
//	ORDER_STATE   NOT NULL VARCHAR2(15)   
//	ORDER_DATE    NOT NULL DATE           
//	ORDER_POST    NOT NULL NUMBER         
//	ORDER_ADDRESS NOT NULL VARCHAR2(1000) 
//	ORDER_NAME    NOT NULL VARCHAR2(30)   
//	ORDER_PHONE   NOT NULL VARCHAR2(13)   
//	METHOD                 VARCHAR2(100)  
	private String orderId;
	private String UserId;
	private int payment;
	private int orderPoint;
	private String orderState;
	private Date orderDate;
	private int orderPost;
	private String orderAddress;
	private String orderName;
	private String orderPhone;
	private String method;//결제방식
}
