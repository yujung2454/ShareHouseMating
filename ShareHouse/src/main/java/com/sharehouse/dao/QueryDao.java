package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sharehouse.dto.QueryDto;

@Mapper
public interface QueryDao {
	int insert(QueryDto dto);	//글 작성
	List<QueryDto> queryList(Map<String, Object> m);
	int count();	//전체 글 갯수
	int updatePost(QueryDto dto); //게시글 수정
	int deletePost(int no); //게시글 삭제
	List<QueryDto> queryListSearch(Map<String, Object> m); //게시글 검색
	int countSearch(Map<String, Object> m); // 전체 글 갯수
	List<QueryDto> querySort(Map<String, Object> m);


}
