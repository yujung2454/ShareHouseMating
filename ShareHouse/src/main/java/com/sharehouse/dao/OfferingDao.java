package com.sharehouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.OfferingDto;

@Mapper
public interface OfferingDao {
	@Select
	("select * from offering")
	List<OfferingDto> selectNo();	
	
}
