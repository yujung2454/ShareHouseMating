package com.sharehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.sharehouse.service.OfferingService;
import com.sharehouse.service.UserService;

@Controller
public class OfferingController {

	@Autowired
	OfferingService service;
	
	@GetMapping("/offer/detail_info")
	public String info() {   
		service.selectNo();
		return "/offer/detail_info";
	}
	
	
	//@GetMapping("/offer/detail_info/{board_no}")
	//public String detail_info() {
	//	return "offer/detail_info";
	//}
}
