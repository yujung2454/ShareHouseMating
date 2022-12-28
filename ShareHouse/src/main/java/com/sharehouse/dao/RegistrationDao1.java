package com.sharehouse.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.sharehouse.dto.OfferingDto;

@Mapper
public interface RegistrationDao1 {
	
	@Insert
	("insert into offering(id, title, offering_add, offering_add2, latitude, longitude) values(#{id}, #{title}, #{offering_add}, #{offering_add2}, #{latitude}, #{longitude})")
	@Options(useGeneratedKeys = true,  keyProperty="board_no")
	int insertMaemul(OfferingDto dto);
	
}
