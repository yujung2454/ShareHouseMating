package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.domain.Role;
import com.sharehouse.dto.CommentDto;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.ReportDto;
import com.sharehouse.dto.UsersDto;
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
	
	@GetMapping("/report_maemul2/{comm_no}")
	public String report_maemul2(Model m,@PathVariable int comm_no) {
		CommunityDto communitydto = service.selectNo2(comm_no);
	      m.addAttribute("communitydto" , communitydto);
		return "/report/report_maemul2";
	}
	
	@PostMapping("/report_maemul2")
	public String insertMaemul2(@AuthenticationPrincipal SecurityUser user, ReportDto dto, int comm_no) {
		String Id = user.getUsers().getId();
		dto.setReporter(Id);
		service.insertReport2(dto);
		service.selectIdNo2(comm_no);
		//System.out.println("board_no: "+board_no);
		return "/popup/report_popup";
	}
	
	// 댓글 신고
	
	@GetMapping("/report_maemul3/{comment_no}")
	public String report_maemul3(Model m,@PathVariable int comment_no) {
		CommentDto commentdto = service.selectNo3(comment_no);
	      m.addAttribute("commentdto" , commentdto);
		return "/report/report_maemul3";
	}
	
	@PostMapping("/report_maemul3")
	public String insertMaemul3(@AuthenticationPrincipal SecurityUser user, ReportDto dto, int comment_no) {
		String Id = user.getUsers().getId();
		dto.setReporter(Id);
		service.insertReport3(dto);
		service.selectIdNo3(comment_no);
		//System.out.println("board_no: "+board_no);
		return "/popup/report_popup";
	}
	
	// 관리자 신고리스트
	@GetMapping("/admin/report_list")
	public String report_list(@RequestParam(name = "p", defaultValue = "1") int page, @AuthenticationPrincipal SecurityUser user, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		int count = service.count();
		//글이 한 개라도 있을 시
		if(count > 0) {
			
			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; //한 페이지의 첫 글 인덱스 번호
			
			List<ReportDto> reportList = service.reportList(startRow);
			m.addAttribute("rList", reportList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			 m.addAttribute("begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			}
		//글이 없을 시
		m.addAttribute("count", count);
		
		List<ReportDto> rp = service.selectAll();
		String status = service.selectSta();
		m.addAttribute("rp" , rp);
		m.addAttribute("status" , status);
		return "admin/ad_report/report_list";
	}
	
	@PostMapping("/admin/report_list")
	public String delChecked(int[] report_no) {
		service.delChecked(report_no);
		return "redirect:/admin/report_list";
	}
	
	@PostMapping("tae/delete")
	@ResponseBody   
	public String delete(String reported_id) {
		System.out.println(reported_id);
	     service.deleteuser(reported_id);
	      return "/admin/ad_report/report_list";
	   }
	
	@PostMapping("tae/update")
	@ResponseBody   
	public String update(String reported_id) {
		System.out.println(reported_id);
	     service.updateuser(reported_id);
	      return "/admin/ad_report/report_list";
	   }
}   
