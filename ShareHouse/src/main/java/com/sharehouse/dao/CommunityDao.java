package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.sharehouse.dto.CommunityDto;

@Mapper
public interface CommunityDao {
	int insert(CommunityDto dto);	//글 작성
	List<CommunityDto> communityList(Map<String, Object> m);
	int count();	//전체 글 갯수
	int updatePost(CommunityDto dto);
	int deletePost(int comm_no);
	CommunityDto viewPost(int comm_no);
}
