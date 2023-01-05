package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
	public String insertComment(CommentDto dto, int comm_no, Model m) {
		List<CommentDto> commentList = service.selectComment(dto.getComm_no()); 
		service.insertComment(dto); 
		Gson gson = new Gson(); 
		/*
		 * int comment_no = service.selectId(comm_no); m.addAttribute("comment_no",
		 * comment_no);
		 */return gson.toJson(commentList); 
	}
		
	@GetMapping("/comment/delete/{comment_no}")
	public String deleteComment(@PathVariable int comment_no) {
		int i = service.deleteComment(comment_no);
		return i+"";
	}
}

