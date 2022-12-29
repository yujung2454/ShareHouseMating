package com.sharehouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("/admin/admin_main")
	public String admin_main() { 
		return "/admin/admin_main";
	}
}
