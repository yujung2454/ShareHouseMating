package com.sharehouse.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.UsersDto;

@Mapper
public interface UserModifyDao {

	int userModify(UsersDto dto);
	@Select("select * from user where Id = #{id}")
	UsersDto selectUser(String id);
	
}
