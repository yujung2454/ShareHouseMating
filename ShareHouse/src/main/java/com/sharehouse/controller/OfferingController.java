package com.sharehouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OfferingController {

	@GetMapping("/offerinfo/detail_info")
	public String info() {    
		return "/offerinfo/detail_info";
}
}
