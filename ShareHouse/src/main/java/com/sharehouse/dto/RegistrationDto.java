package com.sharehouse.dto;

import lombok.Data;

@Data
public class RegistrationDto {
	private int room_no;
	private int board_no;
	private String room_name;
	private int deposit;
	private int rental;
	private int square;
	private int mem_cnt;
	private String img_loc;

}
