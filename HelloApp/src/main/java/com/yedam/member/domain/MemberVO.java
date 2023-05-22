package com.yedam.member.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
//	email varchar(50) PRIMARY KEY,
//	password varchar2(20) not null,
//	name varchar2(50) not null,
//	phone varchar2(20) not null,
//	address varchar2(100) ,
//	auth varchar2(5) default 'User', --Admin, User
//	create_date DATE DEFAULT sysdate
	private String email;
	private String password;
	private String name;
	private String phone;
	private String address;
	private String auth;
	private Date createDate;
}
