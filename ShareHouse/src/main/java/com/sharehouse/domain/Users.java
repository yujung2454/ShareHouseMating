package com.sharehouse.domain;

import lombok.Data;

@Data
public class Users { 
	
	private String Id; 
	private String Pwd;
	private String Name;
	private String Email;
	private String Tel;
	private String Gender;
	private String User_add;
	private String User_add2;
	private String User_Img;
	private Role Status;

}

