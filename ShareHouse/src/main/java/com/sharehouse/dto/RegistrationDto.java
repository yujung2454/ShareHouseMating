package com.sharehouse.dto;

import lombok.Data;

@Data
public class RegistrationDto {
	private int board_no;//
	private String room_name;//
	private String offering_gender;
	private int deposit;//
	private int rental;//
	private int square;//
	private int mem_cnt;//
	private int term;//
	private String img_loc;//
	private int image_no;
	private String offering_info;
	private String thumbnail;
	//
	private String id;
	private String name;
	private String tel;
	private String email;
	private String title;
	private String state;//
}
