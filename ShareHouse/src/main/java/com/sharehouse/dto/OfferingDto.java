package com.sharehouse.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OfferingDto {

	private int Board_no;
	private String Id;
	private String Title;
	private String Room_add;
	private String Latitude;
	private String Longitude;
	private String House_kind;
	private String Term;
	private int Rental;
	private int Deposit;
	private int Room_cnt;
	private int BRoom_cnt;
	private int Mem_cnt;
	private String Room_info;
	private String Room_gender;
	private String Parking;
	private int V_cnt;
	private Date Board_date;
	private String Tel2;
}
