package com.sharehouse.dto;


import com.sharehouse.domain.Role;

import lombok.Data;

@Data
public class UsersDto { 
	

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

