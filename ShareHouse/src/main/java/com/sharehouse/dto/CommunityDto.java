package com.sharehouse.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommunityDto {
	private int comm_no;
	private String comm_title;
	private String comm_con;
	private String id;
	private Date comm_date;
	private int comm_v_cnt;

}

