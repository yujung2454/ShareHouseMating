package com.sharehouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharehouse.dto.RegistrationDto;

@Mapper
public interface RegistrationDao {
	
	int insert(RegistrationDto dto);
	List<RegistrationDto> insert2();
	int update(RegistrationDto dto);
	List<RegistrationDto> fileList();
	RegistrationDto select(int board_no);
	
}
