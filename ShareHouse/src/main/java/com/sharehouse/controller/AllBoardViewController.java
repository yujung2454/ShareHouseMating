package com.sharehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.sharehouse.dto.AllBoardViewDto;
import com.sharehouse.service.AllBoardViewService;


@Controller
public class AllBoardViewController {
	
	@Autowired
	AllBoardViewService service;
	
	@GetMapping("/allboardview")
	public String viewpost(AllBoardViewDto dto) {
		return "/allboardview";
	}
	
	
}
