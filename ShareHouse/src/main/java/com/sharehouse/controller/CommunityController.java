package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.MemberDto;
import com.sharehouse.service.CommunityService;

@SessionAttributes("user")
@Controller
public class CommunityController {
	
	@Autowired
	CommunityService service;
	
	@ModelAttribute("user")
	public MemberDto getDto() {
		return new MemberDto();
	}

	
	@GetMapping("/community/community_write")
	public String wirteForm() {
		return "community/community_write";
	}
	
	@PostMapping("/community/community_write")
	public String community_write(CommunityDto dto) {
		service.insert(dto);
		return "redirect:community_list";
	}
	
	@GetMapping("/community/community_view/{comm_no}")
	public String content(@ModelAttribute("user")MemberDto user, @PathVariable int comm_no, Model m) {
		CommunityDto dto = service.viewPost(comm_no);
		m.addAttribute("dto", dto);
		return "community/community_view";
	}
	
	@RequestMapping("/community/community_list")
	public String community_list(@RequestParam(name="p", defaultValue="1") int page, Model m) {	//p로 page받음. defaultValue="1" - page 번호가 없으면 1을 받아옴. 꺼내온 글을 view에 보내주기위해 model타입 생성
		
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
	
	
}
