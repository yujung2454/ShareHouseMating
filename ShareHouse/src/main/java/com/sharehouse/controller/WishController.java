package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.WishDto;
import com.sharehouse.service.WishService;

@Controller
public class WishController {
	
	@Autowired
	WishService service;
	
	@GetMapping("/mypage/wishlist")
	public String query_list3(String sort, @RequestParam(name="p", defaultValue="1") int page, @AuthenticationPrincipal SecurityUser user, Model m) {	//p로 page받음. defaultValue="1" - page 번호가 없으면 1을 받아옴. 꺼내온 글을 view에 보내주기위해 model타입 생성
		String id = user.getUsers().getId();
		//글이 있는지 체크
		int count = service.count(id);
		//글이 한 개라도 있을 시
		if(count > 0) {
			
			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;//한 페이지의 첫 글 인덱스 번호
			
			List<OfferingDto> wishList = service.selectTitle(id, startRow);
			System.out.println("wishList"+wishList.size());
			m.addAttribute("wList", wishList);
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
		System.out.println("count"+count);
		m.addAttribute("user", user.getUsers());
		
		return "/mypage/wishlist";
	}
	
	@PostMapping("/mypage/wishlist")
	public String delChecked2(int[] board_no) {
		service.delChecked(board_no);
		return "redirect:/mypage/wishlist";
	}
}
