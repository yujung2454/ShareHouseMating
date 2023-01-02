
package com.sharehouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sharehouse.dto.CommentDto;
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

//	@GetMapping("/admin/stop")
//	public String stop() {
//		List<UsersDto> userlist = service.stop_user();
//		Gson gson = new Gson();
//		return gson.toJson(userlist);
//	}
	
//	@PostMapping("stop_user")
//	public String stop_user(HttpServletRequest request) {
//		
//		String[] ajax = request.getParameterValues("valueArr");
//		int size = ajax.length;
//		for(int i=0; i<size; i++) {
//			service.stop_user(ajax[i]);
//		}
//		return "redirect:admin_manage";
//	}
//

	@RequestMapping(method = RequestMethod.POST, value = "/admin/del_user")
	public List<String> del(List<String> delArray) {
		service.del_user(delArray);
		return delArray;
	}
}

