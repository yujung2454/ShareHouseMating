package com.sharehouse.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehouse.dto.RegistrationDto;
import com.sharehouse.service.RegistrationService;

@Controller
public class RegistrationController {

	@Autowired
	RegistrationService service;

	@GetMapping("/registration/registration_second")
	public String registration_second() {
		return "/registration/registration_second";
	}

	@PostMapping("/registration/registration_second")
	public String roomInfoSave(RegistrationDto dto) {
		service.insert(dto);
		return "redirect:registration_second";
	}

	@GetMapping("/registration/registration_third")
	public String registration_third() {
		return "/registration/registration_third";
	}
	
	@PostMapping("/registration/third")
	public String roomInfoSubmit(RegistrationDto dto) {
		service.insert2(dto);
		service.insert3(dto);
		return "redirect:registration_third";
	}

	@PostMapping("/upload")
	@ResponseBody
	public String submit(String room_name, List<MultipartFile> file, HttpServletRequest request, RegistrationDto dto) {
		//for
		  for (MultipartFile multipartfile : file) {
			 if (!multipartfile.isEmpty()) {
				 file.add(multipartfile);
				 return"";
		  }
			 else {
				 return null;
			 }
		}
		System.out.println("파일 업로드 성공!"); 
			
		upload(null, request);
		//db insert : 매물 room_name 파일 경로
		service.insert(dto);
		return "";
	}
	private String upload(MultipartFile file, HttpServletRequest request) {
		String origName = file.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index + 1);// 파일 확장자 저장

		Random r = new Random();
		String fileName = System.currentTimeMillis() + "_" + r.nextInt(50) + "." + ext;

		try {
			String path = request.getServletContext().getRealPath("/room_images");
			File f = new File(path, fileName);
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
}
