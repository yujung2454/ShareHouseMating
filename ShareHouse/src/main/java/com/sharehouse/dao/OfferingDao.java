package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sharehouse.dto.OfferingDto;

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
	 ("select distinct img_loc from room_info where board_no = #{board_no}")
	 String drawing(int board_no);
	 
	 @Select
	 ("select distinct o.board_no, o.offering_gender, r.square, r.deposit, r.rental, r.mem_cnt , r.room_name, r.state from offering o inner join room_info r on o.board_no = r.board_no where o.board_no = #{board_no} and state='n'")
	 List<Map<String, Object>> roominfoTable(int board_no);
	 
	 @Select
	 ("select distinct room_name from room_info_1 where board_no = #{board_no}")
	 List<String> room_name(int board_no);
	 
	 @Select
	 ("select img_loc from room_info_1 where board_no = #{board_no} and room_name = #{room_name}")
	 List<String> img_loc(Map<String, Object> map);
	 
	 @Insert
	 ("insert into applyoffering (id, board_no , room_name) values (#{id} , #{board_no} , #{room_name})")
	 int apply(Map<String, Object> map);
	 
	 @Delete
	 ("delete from offering where board_no = #{board_no}")
	 int delete_board(int board_no);
	 
	 @Insert
	 ("insert into wish_info (id, board_no) values (#{id} , #{board_no})")
	 int wish(Map<String, Object> map);
	 
}
