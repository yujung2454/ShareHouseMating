package com.sharehouse.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.RoomImgDto;
import com.sharehouse.service.OfferingService;
import com.sharehouse.service.UserService;

@Controller
public class OfferingController {

	@Autowired
	OfferingService service;
	
	@GetMapping("/offer/detail_info/{board_no}")
	public String detail_info( @PathVariable int board_no, String room_name, Model m) {   
		
		Map<String, Object> offeringdto = service.SelectRoom(board_no);
		m.addAttribute("offeringdto" , offeringdto);
		List<Map<String, Object>> oList = service.roominfoTable(board_no);
		m.addAttribute("oList", oList);
		List<RoomImgDto> rList = service.room_name();
		m.addAttribute("rList" , rList);
		List<Map<String, Object>> iList = service.img_loc(board_no);
		m.addAttribute("iList", iList);
		return "/offer/detail_info";
	}
	
	@PostMapping("/offer/detail_info/{board_no}")
	   public String info(Model m,@PathVariable int board_no) {   
	      OfferingDto offeringdto = service.selectNo(board_no);
	      m.addAttribute("offeringdto" , offeringdto);
	      return "/offer/detail_info";
	   }
	
	/*
	 * @GetMapping("/offer/detail_info/{board_no}") public String
	 * detail_info(@PathVariable int board_no, Model m) { return
	 * "offer/detail_info"; }
	 */
}
