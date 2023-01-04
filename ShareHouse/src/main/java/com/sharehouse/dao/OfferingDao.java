package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.RoomImgDto;

@Mapper
public interface OfferingDao {
	@Select
	("select * from offering where board_no = #{board_no} ")
	OfferingDto selectNo(int board_no);   
	
	@Update
	("update offering set v_cnt = v_cnt + 1 where board_no = #{board_no}")
	int addReadCount(int board_no);
	
	 @Select
	 ("select * from offering where board_no = #{board_no}") 
	 Map<String, Object> selectRoom(int board_no);
	 
	 @Select
	 ("select o.board_no, o.title, o.offering_gender, o.house_kind, o.board_date, r.square, r.deposit, r.rental, r.room_name from offering o inner join room_info r on o.board_no = r.board_no")
	 List<Map<String, Object>> roominfoTable();
	 
	 @Select
	 ("select room_name from room_info where board_no = #{board_no}")
	 List<RoomImgDto> room_name(int board_no);
	 
	 @Select
	 ("select * from room_info_1 where board_no = #{board_no}")
	 List<Map<String, Object>> img_loc(int board_no);
	 
	 @Insert
	 ("insert into applyoffering (id, board_no , room_name) values (#{id} , #{board_no} , #{room_name})")
	 int apply(Map<String, Object> map);
	 
	 
}
