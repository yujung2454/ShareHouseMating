package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharehouse.dto.OfferingDto;
import com.sharehouse.service.OfferingService;
import com.sharehouse.service.UserService;

@Controller
public class OfferingController {

	@Autowired
	OfferingService service;
	
	@GetMapping("/offer/detail_info/{board_no}")
	public String detail_info() {   
		return "/offer/detail_info";
	}
	
	@PostMapping("/offer/detail_info1/{board_no}")
	public String info(Model m,@PathVariable int board_no) {   
		List<OfferingDto> offeringdto = service.selectNo(board_no);
		m.addAttribute("offeringdto" , offeringdto);
		return "/report_maemul";
	}
	
	//@GetMapping("/offer/detail_info/{board_no}")
	//public String detail_info() {
	//	return "offer/detail_info";
	//}
}
