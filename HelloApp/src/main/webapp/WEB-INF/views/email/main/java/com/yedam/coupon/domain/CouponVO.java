package com.yedam.coupon.domain;

import java.util.Date;

import lombok.Data;
@Data
public class CouponVO {
//	USER_ID      NOT NULL VARCHAR2(16) 
//	DISCOUNT     NOT NULL NUMBER(3,2)  
//	STARTDATE    NOT NULL DATE         
//	ENDDATE      NOT NULL DATE         
//	COUPON_STATE          VARCHAR2(1)  
	private String userId;
	private double disocunt;
	private Date startdate;
	private Date enddate;
	private String couponState;
	
}
