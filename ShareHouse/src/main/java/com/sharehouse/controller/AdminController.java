package com.sharehouse.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.sharehouse.dto.UsersDto;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehouse.service.AdminService;
import com.sharehouse.service.CommunityService;
import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.AdminDto;
import com.sharehouse.dto.CommunityDto;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@Autowired
	CommunityService c_service;
	
	@GetMapping("/admin/allboardview") 
	public String allviewlist(Model m, @RequestParam(name="p", defaultValue = "1") int page, String sort) {

		//글이 있는지 체크
				int count = service.count();
				//글이 한 개라도 있을 시
				if(count > 0) {
					
					int perPage = 10; // 한 페이지에 보일 글의 갯수
					int startRow = (page - 1) * perPage; //한 페이지의 첫 글 인덱스 번호
					
					List<AdminDto> allviewlist1 = service.commviewlist(startRow);
					List<AdminDto> allviewlist2 = service.boardviewlist(startRow);
					m.addAttribute("cList1", allviewlist1);
					m.addAttribute("cList2", allviewlist2);

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
				return "admin/allboardview";
			}

	@GetMapping("/admin/admin_main")
	public String admin_main(@AuthenticationPrincipal SecurityUser user, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		return "/admin/admin_main";
	}

	
	@GetMapping("/admin/admin_notice")
	public String admin_notice(@AuthenticationPrincipal SecurityUser user, String notice, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		List<CommunityDto> communityNotice = c_service.communityNotice(notice);
		m.addAttribute("nList", communityNotice);
		return "/admin/admin_notice";
	}
	
	
	@GetMapping("/admin/user_manage")
	public String userlist(@AuthenticationPrincipal SecurityUser user, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		int count = service.countUser();
		//글이 한 개라도 있을 시
		if(count > 0) {
			
			int perPage = 5; // 한 페이지에 보일 글의 갯수
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
	
	@GetMapping("/admin/user_manage_search")
	public String usersearch(@AuthenticationPrincipal SecurityUser user, String search, @RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		int count = service.countSearch(search);
		//글이 한 개라도 있을 시
		if(count > 0) {
			
			int perPage = 5; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage; //한 페이지의 첫 글 인덱스 번호
			int endRow = page * perPage;
			
			List<UsersDto> userList = service.search(search, startRow);
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
		m.addAttribute("search", search);

		return "/admin/user_manage_search";
	}


	@PostMapping("/admin/stopUser")
	public String btn_stop(String[] user_select) {
		 service.stopUser(user_select);
		return "redirect:/admin/user_manage";
	}
	
	@PostMapping("/admin/release")
	public String btn_release(String[] user_select) {
		service.release(user_select);
		return "redirect:/admin/user_manage";
	}
	
	@PostMapping("/admin/delCheck")
	public String btn_delCheck(String[] user_select) {
		service.delCheck(user_select);
		return "redirect:/admin/user_manage";
	}
	
/*	@PostMapping("/admin/search_stopUser")
	public String search_stop(String[] user_select) {
		 service.stopUser(user_select);
		return "redirect:/admin/user_manage_search";
	}
	
	@PostMapping("/admin/search_release")
	public String search_release(String[] user_select) {
		service.release(user_select);
		return "redirect:/admin/user_manage_search";
	}
	
	@PostMapping("/admin/search_delCheck")
	public String search_delCheck(String[] user_select) {
		service.delCheck(user_select);
		return "redirect:/admin/user_manage_search";
	}*/

}

