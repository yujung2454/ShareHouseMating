package com.sharehouse.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommunityDto {
	private int Comm_no;
	private String Comm_title;
	private String Comm_con;
	private String Id;
	private Date Comm_date;
	private int Comm_v_cnt;
}