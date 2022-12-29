package com.sharehouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.OfferingDto;

@Mapper
public interface OfferingDao {
	@Select
	("select * from offering where board_no = #{board_no} ")
	List<OfferingDto> selectNo(int board_no);	
	
}
