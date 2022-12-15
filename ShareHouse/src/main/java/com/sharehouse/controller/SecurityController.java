package com.sharehouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.UsersDto;
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
		List<CommunityDto> dlist = service.comm();
		m.addAttribute("user",dlist);
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
	public String insert(UsersDto users) { //받아올 정보가 여러개니까 dto객체로 //오버로딩
		service.insertUser(users);
		return "redirect:login/index";
	}

	@GetMapping("/pwd_find")
	public String pwd_find() {
		return "/login/pwd_find";
	}

	
	@GetMapping("/id_find/{}/{}")
	public String id_find() {@PathVariable String Id, .Id..
		return "/login/id_find";
	}
	
	
	@GetMapping("/id_find_email") //ajax에서 요청한 url
	@ResponseBody // ajax에 view없이 데이터만 보낼거기 때문에
	public String findByEmail(String emailAddress, String name){
		Map<String , String> map = new HashMap<>(); //map객체 생성
		map.put("name", name); //생성한 map객체에 데이터 저장
		map.put("email", emailAddress);
		String fbe = service.findByEmail(map);
		return fbe;
	}
	
	@PostMapping("/id_find2")
	public String id_find2() {
		return "/login/id_find2";
	}
	
	
}
