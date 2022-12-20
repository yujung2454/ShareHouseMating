package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.sharehouse.dto.CommentDto;
import com.sharehouse.service.CommentService;

@RestController
public class CommentController {

	@Autowired
	CommentService service;
	
	@GetMapping("/comment/insert")
	public String insertComment(CommentDto dto) {
		service.insertComment(dto);
		List<CommentDto> commentList = service.selectComment(dto.getComm_comment_no());
		Gson gson = new Gson();
		return gson.toJson(commentList);
	}
	
	@GetMapping("/comment/delete/{comm_comment_no}")
	public String deleteComment(@PathVariable int comm_comment_no) {
		int i = service.deleteComment(comm_comment_no);
		return i+"";
	}
}
