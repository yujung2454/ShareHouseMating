package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehouse.service.AdminService;
import com.sharehouse.dto.AdminDto;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@GetMapping("/admin/allboardview") 
	public String allviewlist(Model m, @RequestParam(name="p", defaultValue = "1") int page, String sort) {

		//글이 있는지 체크
				int count = service.count();
				//글이 한 개라도 있을 시
				if(count > 0) {
					
					int perPage = 10; // 한 페이지에 보일 글의 갯수
					int startRow = (page - 1) * perPage; //한 페이지의 첫 글 인덱스 번호
					
					List<AdminDto> allviewlist1 = service.commviewlist(sort, startRow);
					List<AdminDto> allviewlist2 = service.boardviewlist(sort, startRow);
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
				m.addAttribute("sort", sort);
				m.addAttribute("count", count);
				return "admin/allboardview";
			}
		
	
	
		
}
