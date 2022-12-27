package com.sharehouse.dto;

import lombok.Data;

@Data
public class AllBoardViewDto {
	private int board_no; // 매물
	private String title;
	private String id;
	private int v_cnt;
	private int comm_no; // 커뮤니티
	private String comm_title;
	private int comm_v_cnt;
	
}
