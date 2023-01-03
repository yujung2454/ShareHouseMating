package com.sharehouse.controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.UsersDto;
import com.sharehouse.service.UserModifyService;

@Controller
public class MyPageController {
	
	@Autowired
	UserModifyService service;

	@GetMapping("/mypage/info")
	public String mypageInfo(@AuthenticationPrincipal SecurityUser user,Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		
		return "/mypage/info";
	}
	
	@GetMapping("/mypage/modify1")
	public String modifyConfirm(@AuthenticationPrincipal SecurityUser user, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		} else {
			m.addAttribute("user", user.getUsers());
		}
		return "/mypage/modify";
	}
	
	@PostMapping("/mypage/confirm/{password}")
	@ResponseBody
	public boolean passwordConfirm(@AuthenticationPrincipal SecurityUser user,@PathVariable String password) {
		if (user.getUsers().getPwd().equals(password)) {
			return true;
		} else {
			return false;
		}
		
	}
	
	@GetMapping("/mypage/modify2")
	public String userModify(@AuthenticationPrincipal SecurityUser user, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		} else {
			m.addAttribute("user", user.getUsers());
		}
		return "/mypage/modify2";
	}
	
	@PostMapping("mypage/infomodify")
	public String infoModify(MultipartFile userimg, @AuthenticationPrincipal SecurityUser user,UsersDto dto) {
		String Id = user.getUsers().getId();
		dto.setId(Id);
		if(!userimg.isEmpty()) {
			String path = upload(userimg);
			dto.setUser_Img(path);
		}
		service.userModify(dto);
		dto = service.selectUser(Id);
		user.setUsers(dto);
		
		return "redirect:/mypage/info";
	}
	
	public String upload(MultipartFile file) {
		String origName = file.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index + 1);
		
		Random r = new Random();
		String fileName = System.currentTimeMillis() + "_" + r.nextInt(50) + "." + ext;
		
		try {
			String path = ResourceUtils.getFile("classpath:static/images/user/").toPath().toString();
			File f = new File(path, fileName);
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return "/images/user/"+fileName;
	}
}
