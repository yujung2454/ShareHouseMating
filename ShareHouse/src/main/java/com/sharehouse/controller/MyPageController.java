package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.MyPageDto;
import com.sharehouse.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
	
	@RequestMapping(value= "/myPage/application", method = RequestMethod.GET)
	public String application(@AuthenticationPrincipal SecurityUser user, Model m) {
		String id = user.getUsers().getId();
		System.out.println(id);
		List<MyPageDto> dto = service.apply(id);
		m.addAttribute("dto", dto);
		List<MyPageDto> room = service.room(id);
		m.addAttribute("room", room);
		return "/myPage/application";
	}
	
	@DeleteMapping("/myPage/application")
	@ResponseBody
	public String deletepost(String id) {
		service.delete(id);
		return "myPage/application";
	}
}




