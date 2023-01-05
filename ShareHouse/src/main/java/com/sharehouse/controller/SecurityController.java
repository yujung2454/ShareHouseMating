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
import org.springframework.web.bind.support.SessionStatus;



import com.google.gson.Gson;

import com.sharehouse.config.SecurityUser;

import com.sharehouse.dto.UsersDto;


import com.sharehouse.service.UserService;

@Controller
public class SecurityController {

	@Autowired
	UserService service;
	
	@GetMapping("/login")
	public String login() {
		return "/login/login";	
	}
	 @GetMapping("/")
	   public String main(@AuthenticationPrincipal SecurityUser user,Model m){
		 System.out.println("test");
	      if(user == null) {
	         m.addAttribute("user",null);
	      }else {
	         m.addAttribute("user",user.getUsers());
	      }
	      List<Map<String, Object>> olist = service.offering();
	      for(Map<String,Object> offering : olist) {
	    	  String add2 = (String)offering.get("offering_add2");
	    	  String[] arr = add2.split(" ");
	    	  offering.put("dong", arr[2]);
	      }
	      m.addAttribute("offering",olist);
	      Gson gson = new Gson();
	      m.addAttribute("offering2",gson.toJson(olist));
	       return "/main";
	   }
	@GetMapping("/insert")
	public String join() {
		return "/login/insert";
	}
	
	@PostMapping("/insert")
	public String insert(UsersDto users) { //받아올 정보가 여러개니까 dto객체로 //오버로딩
		service.insertUser(users);
		return "redirect:/login";
	}
	
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		String checkid = service.idCheck(id);
		return checkid;
	}
	

	@GetMapping("/logout")
	public String logout() {
		return "/main";
	}
	
	@GetMapping("/id_find")
	public String id_find(){
		return "/login/id_find";
	}
	
	@GetMapping("/id_find_email") //ajax에서 요청한 url
	@ResponseBody // ajax에 view없이 데이터만 보낼거기 때문에
	//변수에 바로 저장 - 변수명 일치하게
	public String findByEmail(String emailAddress, String name){
		Map<String , String> map = new HashMap<>(); //map객체 생성
		map.put("name", name); //생성한 map객체에 데이터 저장
		map.put("email", emailAddress);
		String fbe = service.findByEmail(map);
		return fbe;
	}
	
	@PostMapping("/id_find2")
	public String id_find2(String name, String email, Model m) {
		Map<String , String> map = new HashMap<>();
		map.put("name", name); //생성한 map객체에 데이터 저장
		map.put("email", email);
		
		String fbe2 = service.findByEmail2(map);

		m.addAttribute("fbe2", fbe2);
		return "/login/id_find2";
	}
	
	@GetMapping("/pwd_find")
	public String pwd_find() {
		return "/login/pwd_find";
	}

	@GetMapping("/pwd_find_id")
	@ResponseBody
	public String findById2(UsersDto users) {
		String fbi2 = service.findById2(users);
		return fbi2;
	}
	
	@PostMapping("/pwd_find2")
	public String findById3(String id, String pwd, Model m) {
		m.addAttribute("id", id);
		return "/login/pwd_find2";
	}

	@PostMapping("/update_pwd")
	public String update_pwd(String id, String pwd) {
		Map<String , String> map = new HashMap<>();
		map.put("id", id); //생성한 map객체에 데이터 저장
		map.put("pwd", pwd);
		service.updateUser(map);
		return "redirect:/login";
	}
	
	@GetMapping("/accessDenied")
	public String denied() {
		return "/accessDenied";
	}
}