package com.sharehouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.RegistrationDto;

@Mapper
public interface RegistrationDao {
	
	int insert(RegistrationDto dto);
	int insert2(RegistrationDto dto);
	int update(RegistrationDto dto);
	List<RegistrationDto> fileList();
	@Select("select distinct room_name, board_no from room_info_1 where board_no = #{board_no} order by image_no desc")
	List<RegistrationDto> select(int board_no);
	@Select("select board_no from offering where board_no = #{board_no} order by board_no desc limit 1")
	int selectBoardno(String id);
	
	
}
