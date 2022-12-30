
package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehouse.dto.UsersDto;
import com.sharehouse.service.AdminService;



@Controller
public class AdminController {
	@Autowired
	AdminService service;

	@GetMapping("/admin/admin_main")
	public String admin_main() {
		return "/admin/admin_main";
	}

	@GetMapping("/admin/user_manage")
	public String userlist(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.count();
		//글이 한 개라도 있을 시
		if(count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; //한 페이지의 첫 글 인덱스 번호
			
			List<UsersDto> userList = service.userList(startRow);
			m.addAttribute("uList", userList);

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

		return "/admin/user_manage";
	}
	
	@GetMapping("/admin/user_search")
	public String usersearch(String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		int count = service.countSearch();
		//글이 한 개라도 있을 시
		if(count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; //한 페이지의 첫 글 인덱스 번호
			
			List<UsersDto> userList = service.userListSearch(search, startRow);
			m.addAttribute("uList", userList);

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

		return "/admin/user_search";
	}

//	@GetMapping("/admin/serach_user") public String search_userlist(String id,
// String search, @RequestParam(name="p", defaultValue="1") int page, Model m) {
// int count = service.searchcount(search);
// 
// int perPage = 10; // 한 페이지에 보일 글의 갯수 int startRow = (page - 1) * perPage; //한
// 페이지의 첫 글 인덱스 번호
// 
// List<UsersDto> userlist = service.userlist(id, startRow); //List<UsersDto>
// userList = u_service.findById(String id, startRow); m.addAttribute("uList",
// userlist);
// 
// int pageNum = 5; int totalPages = count / perPage + (count % perPage > 0 ? 1
// : 0); //전체 페이지 수
// 
// int begin = (page - 1) / pageNum * pageNum + 1; int end = begin + pageNum -1;
// if(end > totalPages) { end = totalPages; } m.addAttribute("begin", begin);
// m.addAttribute("end", end); m.addAttribute("pageNum", pageNum);
// m.addAttribute("totalPages", totalPages);
// 
// return "/admin/user_manage"; }

//	@PostMapping("/admin/user_delete") // 일치 
// public String delete(String id) {
//	 * service.delete(id); 
//	 return "redirect:admin/user_manage"; 
//	 }
}

