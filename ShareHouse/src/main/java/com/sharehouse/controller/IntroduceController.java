package com.sharehouse.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sharehouse.config.SecurityUser;

@Controller
public class IntroduceController {

	@GetMapping("/introduce/introduce") 
		public String introduce(@AuthenticationPrincipal SecurityUser user, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		return "introduce/introduce";
		}
	
}

