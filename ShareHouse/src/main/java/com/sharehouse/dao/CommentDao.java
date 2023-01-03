package com.sharehouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sharehouse.dto.CommentDto;

@Mapper
public interface CommentDao {
	List<CommentDto> selectComment(int comm_no);
	int insertComment(CommentDto dto);
	int deleteComment(int comment_no);
	int selectId(int comm_no);
}
