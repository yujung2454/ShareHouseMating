package com.sharehouse.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QueryDto {
	private int query_no; 
	private String id; 
	private String query_title; 
	private String query_state; 
	private Date query_date; 
	private String category; 
	private String query; 
	private String answer; 
}
   