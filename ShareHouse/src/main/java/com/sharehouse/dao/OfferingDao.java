package com.sharehouse.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.OfferingDto;

@Mapper
public interface OfferingDao {
	@Select
	("select * from offering")
	OfferingDto selectNo();	
	
}
