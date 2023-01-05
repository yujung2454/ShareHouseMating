package com.sharehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.service.RegistrationService1;

@Controller
public class RegistrationController1 {

	@Autowired
	RegistrationService1 service;

	@GetMapping("/registration/registration_first")
	public String registration_first(@AuthenticationPrincipal SecurityUser user, Model m) {
		if(user == null) {
	         m.addAttribute("user",null);
	      }else {
	         m.addAttribute("user",user.getUsers());
	      }
		m.addAttribute("user", user.getUsers());
		return "/registration/registration_first";
	}

	@PostMapping("/registration/registration_first")
	public String insertMaemul(@AuthenticationPrincipal SecurityUser user, OfferingDto dto, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		service.insertMaemul(dto);
		m.addAttribute("board_no", dto.getBoard_no());
		return "/registration/registration_second";
	}

}
