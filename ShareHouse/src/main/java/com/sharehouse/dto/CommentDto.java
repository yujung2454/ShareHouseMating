package com.sharehouse.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDto {

	private int comm_comment_no;
	private String id;
	private String comm_comment_con;
	private Date comm_comment_date;
}
