package com.sharehouse.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.PopupDto;
import com.sharehouse.service.PopupService;

@Controller
public class PopupController {
	
	@Autowired
	PopupService service;
	

	@GetMapping("/popup")
	public String Popup(@AuthenticationPrincipal SecurityUser user, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		return "/admin/advertisement";
	}
	
	@PostMapping("/pop_insert")
	@ResponseBody
	public String preview(String room_name, MultipartFile image, Map<String, Object> map,String pop_title) {
		if(!image.isEmpty()) {
			String path = upload(image);
			map.put("pop_title", pop_title);
			map.put("pop_img", path);
			service.preview(map);
			
			return "{}";
		} else {
			
			return "{}";
		}
		
	}
	
	public String upload(MultipartFile file) {
		String origName = file.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index + 1);
		
		Random r = new Random();
		String fileName = System.currentTimeMillis() + "_" + r.nextInt(50) + "." + ext;
		
		try {
			String path = ResourceUtils.getFile("classpath:static/images/admin/").toPath().toString();
			File f = new File(path, fileName);
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return "/images/admin/"+fileName;
	}
	
	@GetMapping("/poutput")
	@ResponseBody
	public PopupDto popup() {
		PopupDto con = service.popup();
		return con;
	}
}
