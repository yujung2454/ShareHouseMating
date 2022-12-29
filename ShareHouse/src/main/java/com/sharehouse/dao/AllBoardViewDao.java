package com.sharehouse.dao;

import org.apache.ibatis.annotations.Mapper;

import com.sharehouse.dto.AllBoardViewDto;

@Mapper
public interface AllBoardViewDao {
	
	int viewpost(AllBoardViewDto dto);
	
}
