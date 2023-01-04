package com.sharehouse.dto;

import java.util.Date;
import lombok.Data;

@Data
public class AdminDto {

	private Date v_date;

	private String id; 
	
	private int comm_no;//커뮤니티
	private String comm_title;
	private int comm_v_cnt;
	
	private int board_no;//매물
	private String title;
	private int v_cnt;

}
