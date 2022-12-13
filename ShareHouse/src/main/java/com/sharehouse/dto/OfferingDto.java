package com.sharehouse.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OfferingDto {

	private int board_no;
	private String id;
	private String title;
	private String room_add;
	private String latitude;
	private String longitude;
	private String house_kind;
	private String term;
	private int rental;
	private int deposit;
	private int room_cnt;
	private int broom_cnt;
	private int mem_cnt;
	private String room_info;
	private String room_gender;
	private String parking;
	private int v_cnt;
	private Date board_date;
	private String tel2;
}
