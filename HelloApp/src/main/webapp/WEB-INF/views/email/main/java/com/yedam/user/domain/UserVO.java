package com.yedam.user.domain;

import java.util.Date;

import lombok.Data;
@Data
public class UserVO {
//	USER_ID       NOT NULL VARCHAR2(16)  
//	USER_PW                VARCHAR2(15)  
//	NICKNAME               VARCHAR2(18)  
//	USER_ADDRESS           VARCHAR2(100) 
//	USER_POST     NOT NULL NUMBER        
//	USER_GENDER   NOT NULL VARCHAR2(1)   
//	USER_PHONE    NOT NULL VARCHAR2(13)  
//	USER_GRADE             VARCHAR2(10)  
//	USER_MONEY             NUMBER        
//	USER_DATE              DATE          
//	USER_POINT             NUMBER        
//	USER_BIRTH    NOT NULL DATE          
//	USER_CATEGORY          VARCHAR2(200) 
//	EMAIL         NOT NULL VARCHAR2(30)  
	private String userId;
	private String userPw;
	private String nickname;
	private String userAddress;
	private int userPost;
	private String userGender;
	private String userPhone;
	private String userGrade;
	private int usermoney;
	private Date userDate;
	private String userPoint;
	private Date userBirth;
	private String userCategory;
	private String email;
}
