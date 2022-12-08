package com.sharehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.domain.Users;
import com.sharehouse.service.UserService;

@Controller
public class SecurityController {

	@Autowired
	UserService service;
	
	@GetMapping("/baesoeun/index")
	public String index() {
		System.out.println("index 요청입니다.");
		return "/baesoeun/index";
	}
	@GetMapping("/baesoeun/member")
	public String forMember() {
		System.out.println("Member 요청입니다.");
		return "/baesoeun/member";
		
	}
	@GetMapping("/baesoeun/manager")
	public String formamger() {
		System.out.println("Manager 요청입니다.");
		return "/baesoeun/manager";
	}
	
	@GetMapping("/baesoeun/admin")
	public String forAdmin(@AuthenticationPrincipal SecurityUser user) { // 세션에 저장된 정보 꺼내쓰기
		System.out.println("user.getUsername() :" +user.getUsername());
		System.out.println("Admin 요청입니다.");
		return "/baesoeun/admin";
	}
	
	@GetMapping("/baesoeun/login")
	public String login() {
		return "/baesoeun/login";
		
	}
	@GetMapping("/baesoeun/loginSuccess")
	public String loginSuccess() {
		return "/baesoeun/loginSuccess";
	}
	@GetMapping("/baesoeun/accessDenied")
	public String accessDenied() {	
		return "/baesoeun/accessDenied";
	}
	
	@GetMapping("/baesoeun/insert")
	public String insert() {
		return "/baesoeun/insert";
	}
	@PostMapping("/baesoeun/insert")
	public String insert(Users users) { //받아올 정보가 여러개니까 dto객체로 //오버로딩
		service.insertUser(users);
		return "redirect:baesoeun/index";
	}
	@GetMapping("/baesoeun/find")
	public String find() {
		return "/baesoeun/find";
	}
}
