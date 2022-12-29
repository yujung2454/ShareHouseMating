package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sharehouse.dto.OfferingDto;
import com.sharehouse.service.OfferingService;
import com.sharehouse.service.UserService;

@Controller
public class OfferingController {

	@Autowired
	OfferingService service;
	
	@GetMapping("/offer/detail_info")
	public String info(Model m) {   
		List<OfferingDto> offeringdto = service.selectNo();
		m.addAttribute(offeringdto);
		return "/offer/detail_info";
	}
	
	
	//@GetMapping("/offer/detail_info/{board_no}")
	//public String detail_info() {
	//	return "offer/detail_info";
	//}
}
