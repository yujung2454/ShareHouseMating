package com.sharehouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OfferingController {

	@GetMapping("/offer/detail_info")
	public String info() {    
		return "/offer/detail_info";
	}

	//@GetMapping("/offer/detail_info/{board_no}")
	//public String detail_info() {
	//	return "offer/detail_info";
	//}
}
