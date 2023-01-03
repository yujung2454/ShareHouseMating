package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.CommentDto;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;

	@GetMapping("/myPage/myPage_community")
	public String community(@AuthenticationPrincipal SecurityUser user, @RequestParam(name="p", defaultValue="1") int page, Model m) {
		String id = user.getUsers().getId();
		int comm_count = service.comm_count(id);
		m.addAttribute("user", user.getUsers());
		
		if(comm_count > 0) {
			
			int perPage = 5;
			int startRow = (page - 1) * perPage;
			
			List<CommunityDto> MyCommunityList = service.MyCommunityList(id, startRow);
			m.addAttribute("mList", MyCommunityList);
			System.out.println(MyCommunityList.size());

			
			int pageNum = 5;
			int totalPages = comm_count / perPage + (comm_count % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			 m.addAttribute( "begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			}
		//글이 없을 시
		m.addAttribute("id", id);
		m.addAttribute("count", comm_count);
		
		
			int offer_count = service.offer_count(id);
		
			if(offer_count > 0) {
			
			int perPage = 5;
			int startRow = (page - 1) * perPage;
			
			List<OfferingDto> MyOfferingList = service.MyOfferingList(id, startRow);
			m.addAttribute("oList", MyOfferingList);
			
			int pageNum = 5;
			int totalPages = offer_count / perPage + (offer_count % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			 m.addAttribute( "begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			}
		//글이 없을 시
		m.addAttribute("id", id);
		m.addAttribute("count", offer_count);
		
		
		int comment_count = service.comment_count(id);
		
		if(comment_count > 0) {
		
		int perPage = 5;
		int startRow = (page - 1) * perPage;
		
		List<OfferingDto> CommentList = service.MyOfferingList(id, startRow);
		m.addAttribute("cList", CommentList);
		
		int pageNum = 5;
		int totalPages = comment_count / perPage + (comment_count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute( "begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		}
	//글이 없을 시
	m.addAttribute("id", id);
	m.addAttribute("count", comment_count);
		
		return "myPage/myPage_community";
	}
}
