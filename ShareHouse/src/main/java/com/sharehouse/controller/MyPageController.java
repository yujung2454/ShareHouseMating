package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehouse.dto.CommunityDto;
import com.sharehouse.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;

	@GetMapping("/myPage/myPage_community")
	public String community(String id, @RequestParam(name="p", defaultValue="1") int page, Model m) {
		
		int count = service.count();
		
		if(count > 0) {
			
			int perPage = 10;
			int startRow = (page - 1) * perPage;
			
			List<CommunityDto> MyCommunityList = service.MyCommunityList(id, startRow);
			m.addAttribute("mList", MyCommunityList);
			
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
		m.addAttribute("id", id);
		m.addAttribute("count", count);
		
		return "myPage/myPage_community";
	}
}
