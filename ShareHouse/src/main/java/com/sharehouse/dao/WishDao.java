package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.WishDto;

@Mapper
public interface WishDao {
	
	int count();
	
	List<WishDto> wishList(Map<String, Object> m);
	
	int delChecked(int[] board_no);
	
	@Select
	("select title from offering o inner join wish_info w on o.board_no = w.board_no")
	String selectTitle();
}
