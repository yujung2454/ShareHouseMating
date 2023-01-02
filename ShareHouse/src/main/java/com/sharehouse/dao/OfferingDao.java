package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.RoomImgDto;

@Mapper
public interface OfferingDao {
	@Select
	("select * from offering where board_no = #{board_no} ")
	OfferingDto selectNo(int board_no);   
	
	
	 @Select
	 ("select * from offering where board_no = #{board_no}") 
	 Map<String, Object> selectRoom(int board_no);
	 
	 @Select
	 ("select o.title, o.offering_gender, o.house_kind, o.board_date, r.square, r.deposit, r.rental from offering o inner join room_info r on o.board_no = r.board_no")
	 List<Map<String, Object>> roominfoTable();
	 
	 @Select
	 ("select distinct room_name from room_info")
	 List<RoomImgDto> room_name();
	 
	 @Select
	 ("select * from room_info where board_no = #{board_no}")
	 List<Map<String, Object>> img_loc();
}
