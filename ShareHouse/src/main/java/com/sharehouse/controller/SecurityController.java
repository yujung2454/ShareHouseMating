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
	
	@GetMapping("/")
	public String index() {
		System.out.println("index 요청입니다.");
		return "index";
	}
	@GetMapping("/member")
	public void forMember() {
		System.out.println("Member 요청입니다.");
		
	}
	@GetMapping("/manager")
	public void formamger() {
		System.out.println("Manager 요청입니다.");
	}
	@GetMapping("/admin")
	public void forAdmin(@AuthenticationPrincipal SecurityUser user) { // 세션에 저장된 정보 꺼내쓰기
		System.out.println("user.getUsername() :" +user.getUsername());
		System.out.println("Admin 요청입니다.");
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	@GetMapping("/loginSuccess")
	public void loginSuccess() {
		
	}
	@GetMapping("/accessDenied")
	public void accessDenied() {		
	}
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	@PostMapping("/insert")
	public String insert(Users users) { //받아올 정보가 여러개니까 dto객체로 //오버로딩
		service.insertUser(users);
		return "redirect:/";
	}
}
