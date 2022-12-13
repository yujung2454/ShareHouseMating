package com.sharehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.domain.Users;
import com.sharehouse.service.UserService;

@Controller
public class SecurityController {

	@Autowired
	UserService service;
	
	@GetMapping("/index")
	public String index() {
		System.out.println("index 요청입니다.");
		return "/login/index";
	}
	@GetMapping("/member")
	public String forMember() {
		System.out.println("Member 요청입니다.");
		return "/login/member";
		
	}
	@GetMapping("/manager")
	public String formamger() {
		System.out.println("Manager 요청입니다.");
		return "/login/manager";
	}
	
	@GetMapping("/admin")
	public String forAdmin(@AuthenticationPrincipal SecurityUser user) { // 세션에 저장된 정보 꺼내쓰기
		System.out.println("user.getUsername() :" +user.getUsername());
		System.out.println("Admin 요청입니다.");
		return "/login/admin";
	}
	
	@GetMapping("/login")
	public String login() {
		return "/login/login";	
	}
	
	@GetMapping("/")
	public String main(Model m){
	    m.addAttribute("user");
	    return "/main";
	}
	
	@GetMapping("/accessDenied")
	public String accessDenied() {	
		return "/login/accessDenied";
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "/login/insert";
	}
	@PostMapping("/insert")
	public String insert(Users users) { //받아올 정보가 여러개니까 dto객체로 //오버로딩
		service.insertUser(users);
		return "redirect:login/index";
	}

	@GetMapping("/pwd_find")
	public String pwd_find() {
		return "/login/pwd_find";
	}

	@GetMapping("/joinView")
	public String joinView() {
		return "/login/joinView";
	}
}
