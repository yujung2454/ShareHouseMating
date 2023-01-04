package com.sharehouse.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String detail_info(@AuthenticationPrincipal SecurityUser user, @PathVariable int board_no, String room_name, Model m) {   
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		OfferingDto dto = service.selectNo(board_no);
		m.addAttribute("dto",dto);
		Map<String, Object> offeringdto = service.SelectRoom(board_no);
		m.addAttribute("offeringdto" , offeringdto);
		List<Map<String, Object>> oList = service.roominfoTable(board_no);
		m.addAttribute("oList", oList);
		List<RoomImgDto> rList = service.room_name(board_no);
		m.addAttribute("rList" , rList);
		List<Map<String, Object>> iList = service.img_loc(board_no);
		m.addAttribute("iList", iList);
		return "/offer/detail_info";
	}
	@PostMapping("/offer/detail_info")
	public String apply(@AuthenticationPrincipal SecurityUser user, Model m, int board_no, String room_name) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		service.apply(user.getUsers().getId(), board_no,room_name );
		return "offer/detail_info";
	}

}
