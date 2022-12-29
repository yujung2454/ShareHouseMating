package com.sharehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.ReportDto;
import com.sharehouse.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	ReportService service;
	
	@GetMapping("/report_maemul")
	public String report_maemul() {
		return "/report/report_maemul";
	}
	
	@PostMapping("/report_maemul")
	public String insertMaemul(@AuthenticationPrincipal SecurityUser user, ReportDto dto, int board_no) {
		String Id = user.getUsers().getId();
		dto.setReporter(Id);
		service.insertReport(dto);
		service.selectIdNo(board_no);
		System.out.println("board_no: "+board_no);
		return "/offer/detail_info";
	}
}
