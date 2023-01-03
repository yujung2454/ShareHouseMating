package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sharehouse.dto.AdminDto;

@Mapper
public interface AdminDao {
	
	List<AdminDto> commviewlist(Map<String, Object> m);
	List<AdminDto> boardviewlist(Map<String, Object> m);
	int count();
	int countSearch(Map<String, Object> m); // 전체 글 갯수
	List<AdminDto> Sort(Map<String, Object> m);
}

