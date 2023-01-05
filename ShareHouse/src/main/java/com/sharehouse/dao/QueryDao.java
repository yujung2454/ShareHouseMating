package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.QueryDto;

@Mapper
public interface QueryDao {
	//유저 dao
	int insert(QueryDto dto);	//글 작성
	List<QueryDto> queryList(Map<String, Object> m);
	int count();	//전체 글 갯수
	QueryDto queryOne(int query_no);
	int updatePost(QueryDto dto); //게시글 수정
	int deletePost(int no); //게시글 삭제
	List<QueryDto> queryListSearch(Map<String, Object> m); //게시글 검색
	int countSearch(Map<String, Object> m); // 전체 글 갯수
	List<QueryDto> querySort(Map<String, Object> m);
	
	int count2(String id);
	List<QueryDto> queryList2(Map<String, Object> m);
	
	//관리자 dao
	int delChecked(int[] query_no);
	int insertAnswer(QueryDto dto);
}
