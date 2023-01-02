package com.sharehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.CommentDto;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.ReportDto;
import com.sharehouse.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	ReportService service;
	
	// 매물 신고
	
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
	
	
	// 커뮤니티 신고
	
	@GetMapping("/report_maemul/{comm_no}")
	public String report_maemul2(Model m,@PathVariable int comm_no) {
		CommunityDto communitydto = service.selectNo2(comm_no);
	      m.addAttribute("communitydto" , communitydto);
		return "/report/report_maemul";
	}
	
	@PostMapping("/report_maemul")
	public String insertMaemul2(@AuthenticationPrincipal SecurityUser user, ReportDto dto, int comm_no) {
		String Id = user.getUsers().getId();
		dto.setReporter(Id);
		service.insertReport2(dto);
		service.selectIdNo2(comm_no);
		//System.out.println("board_no: "+board_no);
		return "/popup/report_popup";
	}
	
	// 댓글 신고
	
	@GetMapping("/report_maemul/{comment_no}")
	public String report_maemul3(Model m,@PathVariable int comment_no) {
		CommentDto commentdto = service.selectNo3(comment_no);
	      m.addAttribute("commentdto" , commentdto);
		return "/report/report_maemul";
	}
	
	@PostMapping("/report_maemul")
	public String insertMaemul3(@AuthenticationPrincipal SecurityUser user, ReportDto dto, int comment_no) {
		String Id = user.getUsers().getId();
		dto.setReporter(Id);
		service.insertReport3(dto);
		service.selectIdNo3(comment_no);
		//System.out.println("board_no: "+board_no);
		return "/popup/report_popup";
	}
}
