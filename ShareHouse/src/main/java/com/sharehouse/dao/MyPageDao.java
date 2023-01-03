package com.sharehouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharehouse.dto.MyPageDto;

@Mapper
public interface MyPageDao {
	List<MyPageDto> apply(String id);
	List<MyPageDto> room(String id);

	int delete(String id);

}
