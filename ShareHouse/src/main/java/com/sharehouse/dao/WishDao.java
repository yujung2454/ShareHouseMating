package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.WishDto;

@Mapper
public interface WishDao {
	
	int count(String id);
	
	List<WishDto> wishList(Map<String, Object> m);
	
	int delChecked(int[] board_no);
	
	@Select
	("select o.board_no, title from offering o inner join wish_info w on o.board_no = w.board_no where w.id = #{id}  limit #{start} , #{count}")
	List<OfferingDto> selectTitle(Map<String, Object> m);
}
