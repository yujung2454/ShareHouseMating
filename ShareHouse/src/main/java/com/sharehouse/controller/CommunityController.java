package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehouse.dto.CommunityDto;
import com.sharehouse.service.CommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService service;
	
	@GetMapping("/community/community_write")
	public String wirteForm() {
		return "community/community_write";
	}
	
	@PostMapping("/community/community_write")
	public String community_write(CommunityDto dto) {
		service.insert(dto);
		return "redirect:community_list";
	}
	
	/*
	 * @GetMapping("community/community_content/{no}")
	 * public String community_content(@PathVariable int no, Model m) {
	 * CommunityDto dto = service.communityOne(no);
	 * m.addAttribute("dto", dto);
	 * List<CommentDto> commentList = c_service.selectComment(no);
	 * m.addAttribute("commentList", commentList);
	 * return "community/community_content";
	 */
	
	@RequestMapping("community/community_list")
	public String community_list(String sort, @RequestParam(name="p", defaultValue="1") int page, Model m) {	//p로 page받음. defaultValue="1" - page 번호가 없으면 1을 받아옴. 꺼내온 글을 view에 보내주기위해 model타입 생성
		
		//글이 있는지 체크
		int count = service.count();
		//글이 한 개라도 있을 시
		if(count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; //한 페이지의 첫 글 인덱스 번호
			
			List<CommunityDto> communityList = service.communityList(startRow);
			m.addAttribute("cList", communityList);

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
		return "community/community_list";
	}
	
	@GetMapping("/community/community_search")
	public String search(String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<CommunityDto> communityList = service.communityListSearch(search,startRow);
		m.addAttribute("cList", communityList);
		

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		 m.addAttribute("end", end);
		}
		m.addAttribute("count", count);
		m.addAttribute("search", search);
		
		return "community/community_search";
	}
	
	@GetMapping("/community/community_sort")
	public String communitySort(String search, String sort, @RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.count();
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<CommunityDto> communityList = service.communitySort(sort,startRow);
		m.addAttribute("cList", communityList);
		

		int pageNum = 5;
		int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum - 1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute("begin", begin);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		 m.addAttribute("end", end);
		}
		m.addAttribute("count", count);
		m.addAttribute("search", search);
		m.addAttribute("sort", sort);
		
		return "community/community_sort";
	}
	
}
