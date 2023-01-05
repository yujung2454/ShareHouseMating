package com.sharehouse.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OfferingDto {

	private int board_no;
	private String id;
	private String title;
	private String offering_add;
	private String offering_add2;
	private String latitude;
	private String longitude;
	private String house_kind;
	private String thumbnail;
	private String offering_info;
	private String offering_gender;
	private int v_cnt;
	private Date board_date;
	private String state;
}
