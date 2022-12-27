package com.sharehouse.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDto {
	private int comm_no;
	private int comment_no;
	private String id;
	private String comment_con;
	private Date comment_date;
}
