package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.CommunityDto;

@Mapper
public interface CommunityDao {
	int insert(CommunityDto dto);	//글 작성
	List<CommunityDto> communityList(Map<String, Object> m);
	int count();	//전체 글 갯수
	CommunityDto communityOne(int no);
	int updatePost(CommunityDto dto); //게시글 수정
	int deletePost(int no); //게시글 삭제
	List<CommunityDto> communityListSearch(Map<String, Object> m); //게시글 검색
	int countSearch(Map<String, Object> m); // 전체 글 갯수
	int addReadcount(int no); //조회수 증가
	List<CommunityDto> communitySort(Map<String, Object> m);


}
