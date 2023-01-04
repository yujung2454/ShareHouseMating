package com.sharehouse.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.CommentDto;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.service.CommentService;
import com.sharehouse.service.CommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService service;
	
	@Autowired
	CommentService c_service;
	
	@GetMapping("/community/community_write")
	   public String writeForm(@AuthenticationPrincipal SecurityUser user, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
	      m.addAttribute("user", user.getUsers());
	      return "community/community_write";
	   }
	
	@PostMapping("/community/community_write")
	public String community_write(CommunityDto dto) {
		service.insert(dto);
		return "redirect:community_list";
	}
	
	@GetMapping("/community/community_view/{comm_no}")
	public String content(@AuthenticationPrincipal SecurityUser user, @PathVariable int comm_no, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		CommunityDto dto = service.communityOne(comm_no);
		m.addAttribute("dto", dto);
		List<CommentDto> commentList = c_service.selectComment(comm_no);
		m.addAttribute("commentList", commentList);
		m.addAttribute("user", user.getUsers());
		return "community/community_view";
	}
	
	@GetMapping("/community/community_update/{comm_no}")
	public String community_update(@AuthenticationPrincipal SecurityUser user, @PathVariable int comm_no, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		CommunityDto dto = service.communityOne(comm_no);
		m.addAttribute("dto", dto);
		return "community/community_update";
	}
	
	@PutMapping("/community/community_update")
	public String update(CommunityDto dto) {
		service.updatePost(dto);
		return "redirect:community_list";
	}
	
	@DeleteMapping("/community/delete")
	@ResponseBody
	public String delete(int comm_no) {
		int i = service.deletePost(comm_no);
		return ""+i;
	}
	
	@GetMapping("community/community_list")
	public String community_list(@AuthenticationPrincipal SecurityUser user, String notice, String sort, @RequestParam(name="p", defaultValue="1") int page, Model m) {	//p로 page받음. defaultValue="1" - page 번호가 없으면 1을 받아옴. 꺼내온 글을 view에 보내주기위해 model타입 생성

		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		//글이 있는지 체크
		int count = service.count();
		//글이 한 개라도 있을 시
		if(count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; //한 페이지의 첫 글 인덱스 번호
			
			List<CommunityDto> communityList = service.communityList(sort, startRow);
			m.addAttribute("cList", communityList);
			List<CommunityDto> communityNotice = service.communityNotice(notice);
			m.addAttribute("nList", communityNotice);

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
		m.addAttribute("sort", sort);
		m.addAttribute("count", count);
		return "community/community_list";
	} 
	
	@GetMapping("/community/community_search")
	public String search(@AuthenticationPrincipal SecurityUser user, String notice, String sort, String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		
		int count = service.countSearch(search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<CommunityDto> communityList = service.communityListSearch(sort, search, startRow);
		m.addAttribute("cList", communityList);
		List<CommunityDto> communityNotice = service.communityNotice(notice);
		m.addAttribute("nList", communityNotice);
		

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
		m.addAttribute("sort", sort);
		m.addAttribute("search", search);
		
		return "community/community_search";
	}

	
}
