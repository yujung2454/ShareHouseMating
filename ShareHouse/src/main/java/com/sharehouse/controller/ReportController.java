package com.sharehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.ReportDto;
import com.sharehouse.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	ReportService service;
	
	@GetMapping("/report_maemul/{board_no}")
	public String report_maemul(Model m,@PathVariable int board_no) {
		OfferingDto offeringdto = service.selectNo(board_no);
	      m.addAttribute("offeringdto" , offeringdto);
		return "/report/report_maemul";
	}
	
	@PostMapping("/report_maemul")
	public String insertMaemul(@AuthenticationPrincipal SecurityUser user, ReportDto dto, int board_no) {
		String Id = user.getUsers().getId();
		dto.setReporter(Id);
		service.insertReport(dto);
		service.selectIdNo(board_no);
		//System.out.println("board_no: "+board_no);
		return "/popup/report_popup";
	}
	
	@GetMapping("/re_cancle_popup")
	public String re_cancle_popup() {
		return "/popup/re_cancle_popup";
	}
}
