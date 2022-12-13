package com.sharehouse.domain;


import lombok.Data;

@Data
public class Users { 
	

	private String id; 
	private String pwd;
	private String name;
	private String email;
	private String tel;
	private String gender;
	private String user_add;
	private String user_add2;
	private String user_Img;
	private Role status;

}

