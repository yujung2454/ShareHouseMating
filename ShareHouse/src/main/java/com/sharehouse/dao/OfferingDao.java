package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.OfferingDto;

@Mapper
public interface OfferingDao {
	@Select
	("select * from offering where board_no = #{board_no} ")
	OfferingDto selectNo(int board_no);   
	
	/*
	 * @Select
	 * ("select * from offering o inner join room_info r on o.board_no = r.board_no where board_no = #{board_no}"
	 * ) List<Map<String, Object>> selectRoom();
	 */
}
