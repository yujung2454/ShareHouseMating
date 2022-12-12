package com.sharehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.CommentDao;
import com.sharehouse.dto.CommentDto;

@Service
public class CommentService {

	@Autowired
	CommentDao dao;
	
	public List<CommentDto> selectComment(int comm_comment_no){
		return dao.selectComment(comm_comment_no);
	}
	
	public int insertComment(CommentDto dto) {
		return dao.insertComment(dto);
	}
	
	public int deleteComment(int comm_comment_no) {
		return dao.deleteComment(comm_comment_no);
	}
}
