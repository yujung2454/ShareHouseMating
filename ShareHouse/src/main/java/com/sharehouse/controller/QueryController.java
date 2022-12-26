package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.CommentDto;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.QueryDto;
import com.sharehouse.service.QueryService;

@Controller
public class QueryController {
	
	@Autowired
	QueryService service;
	
	// 유저 컨트롤러
	
	@GetMapping("/query_write")
	public String wirteForm(@AuthenticationPrincipal SecurityUser user, Model m) {
		m.addAttribute("user", user.getUsers());
		return "query/query_write";
	}
	
	@PostMapping("/query_write")
	public String query_write(QueryDto dto) {
		service.insert(dto);
		return "redirect:query_list";
	}
	
	@GetMapping("/query_view/{query_no}")
	public String content(@AuthenticationPrincipal SecurityUser user, @PathVariable int query_no, Model m) {
		QueryDto dto = service.queryOne(query_no);
		m.addAttribute("user", user.getUsers());
		m.addAttribute("dto", dto);
		/*
		 * List<CommentDto> commentList = c_service.selectComment(comm_no);
		 * m.addAttribute("commentList", commentList);
		 */
		return "query/query_view";
	}
	
	@GetMapping("/query_update/{query_no}")
	public String query_update(@PathVariable int query_no, Model m) {
		QueryDto dto = service.queryOne(query_no);
		m.addAttribute("dto", dto);
		return "query/query_update";
	}
	
	@PutMapping("/query_update")
	public String update(QueryDto dto) {
		service.updatePost(dto);
		return "redirect:query_list";
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public String delete(int query_no) {
		 service.deletePost(query_no);
		return "/ad_query_list";
	}
	
	@GetMapping("/query_list")
	public String query_list(String sort, @RequestParam(name="p", defaultValue="1") int page, Model m) {	//p로 page받음. defaultValue="1" - page 번호가 없으면 1을 받아옴. 꺼내온 글을 view에 보내주기위해 model타입 생성
		
		//글이 있는지 체크
		int count = service.count();
		//글이 한 개라도 있을 시
		if(count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; //한 페이지의 첫 글 인덱스 번호
			
			List<QueryDto> queryList = service.queryList(startRow);
			m.addAttribute("qList", queryList);

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
		return "query/query_list";
	}
	
	@GetMapping("/query_search")
	public String search(String search,@RequestParam(name="p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch(search);
		if(count > 0) {
		
		int perPage = 10; // 한 페이지에 보일 글의 갯수
		int startRow = (page - 1) * perPage;
		int endRow = page * perPage;
		
		List<QueryDto> queryList = service.queryListSearch(search,startRow);
		m.addAttribute("qList", queryList);
		

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
		
		return "query/query_search";
	}
	
	//관리자 컨트롤러
	
	@GetMapping("/ad_query_list")
	public String query_list2(String sort, @RequestParam(name="p", defaultValue="1") int page, Model m, QueryDto dto) {	//p로 page받음. defaultValue="1" - page 번호가 없으면 1을 받아옴. 꺼내온 글을 view에 보내주기위해 model타입 생성
		
		//글이 있는지 체크
		int count = service.count();
		//글이 한 개라도 있을 시
		if(count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; //한 페이지의 첫 글 인덱스 번호
			
			List<QueryDto> Qdto = service.uql(dto);
			List<QueryDto> queryList = service.queryList(startRow);
			m.addAttribute("qList", queryList);
			m.addAttribute("dto",Qdto);
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
		return "ad_query/ad_query_list";
	}
	
}
