package com.sharehouse.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.RoomImgDto;
import com.sharehouse.service.OfferingService;
import com.sharehouse.service.UserService;

@Controller
public class OfferingController {

	@Autowired
	OfferingService service;
	
	@GetMapping("/offer/detail_info/{board_no}")
	public String detail_info(@AuthenticationPrincipal SecurityUser user, @PathVariable int board_no, Model m) {   
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		OfferingDto dto = service.selectNo(board_no);
		m.addAttribute("dto",dto);
		Map<String, Object> offeringdto = service.SelectRoom(board_no);
		m.addAttribute("offeringdto" , offeringdto);
		String drawing = service.drawing(board_no);
		m.addAttribute("drawing", drawing);
		List<Map<String, Object>> oList = service.roominfoTable(board_no);
		m.addAttribute("oList", oList);
		List<String> rList = service.room_name(board_no);
		m.addAttribute("rList" , rList);
		List<List<String>> imgLists = new ArrayList<>();
		for (String room_name : rList ) {
			System.out.println(board_no+"   "+ room_name);
			List<String> iList = service.img_loc(board_no, room_name);
			imgLists.add(iList);
		}
		System.out.println(imgLists);
		m.addAttribute("imgLists", imgLists);
		
		return "/offer/detail_info";
	}
	@PostMapping("/offer/detail_info")
	public String apply(@AuthenticationPrincipal SecurityUser user, Model m, String id, int board_no, String room_name) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		
		System.out.println();
		service.apply(user.getUsers().getId(), board_no,room_name );
		return "redirect:/offer/detail_info/"+board_no;
	}
	
	@DeleteMapping("/offer/delete")
	@ResponseBody
	public String delete_board(int board_no) {
		int i = service.delete_board(board_no);
		return ""+i;
	}

	@PostMapping("/offer/wish")
	public String wish(@AuthenticationPrincipal SecurityUser user,int board_no) {
		System.out.println(board_no);
		service.wish(board_no, user.getUsers().getId());
		return "redirect:/offer/detail_info/"+board_no;
	}
	
	@GetMapping("/wish/{board_no}")
	@ResponseBody
	public int jjim(@AuthenticationPrincipal SecurityUser user, int board_no) {
		String id = user.getUsers().getId();
		System.out.println(board_no);
		service.wish(board_no, id);
		return 1;
	}
}
