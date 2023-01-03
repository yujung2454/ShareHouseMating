package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SearchOfferingDao {

	@Select("select o.board_no, o.title, o.offering_add, o.offering_add2, o.latitude, o.longitude, r.deposit, r.rental, r.square, o.thumbnail from offering o inner join room_info r on o.board_no = r.board_no where o.offering_add2 like (select offering_add2 from offering where offering_add like concat('%',#{loc},'%') or offering_add2 like concat('%',#{loc},'%') limit 1)")
	List<Map<String, Object>> searchedoffer(String loc);
	
	@Select("select latitude, longitude from offering")
	List<Map<String, Object>> latlng();
	
	List<Map<String, Object>> dresult(Map<String, Object> map);
}
