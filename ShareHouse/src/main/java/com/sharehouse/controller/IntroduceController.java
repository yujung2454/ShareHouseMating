package com.sharehouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IntroduceController {

	@GetMapping("/introduce/introduce") 
		public String introduce() {
			return "introduce/introduce";
		}
	
}

