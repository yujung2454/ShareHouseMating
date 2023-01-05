package com.sharehouse.dto;

import java.util.List;

import lombok.Data;

@Data
public class RoomInfoDto {
	private int board_no;
	private List<RegistrationDto> rinfo;
}
