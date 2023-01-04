package com.sharehouse.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReportDto {
	private int report_no; 
	private String reporter; 
	private String reported_id; 
	private String category; 
	private String report_con; 
	private int comm_no; 
	private int board_no; 
	private int comment_no;
}
