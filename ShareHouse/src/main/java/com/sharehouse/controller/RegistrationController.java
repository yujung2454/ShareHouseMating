package com.sharehouse.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;


import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@GetMapping("/registration/registration_third/{board_no}")
	public String registration_third(@PathVariable int board_no, Model m) {
		RegistrationDto dto = service.select(board_no);
		m.addAttribute("dto", dto);
		return "/registration/registration_third";
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


	@PostMapping("/upload")
	@ResponseBody
	public String submit(RegistrationDto dto, List<MultipartFile> file, HttpServletRequest request) {
		System.out.println(dto.getBoard_no()+ dto.getRoom_name());
		for (MultipartFile multipartfile : file) {
			if (!multipartfile.isEmpty()) {
				String path = upload(multipartfile, request);
				//db insert : 매물 room_name 파일 경로
				dto.setImg_loc(path);
				service.insert(dto);				 
			}
			else {
				System.out.println("empty");
			}
		}
		System.out.println("저장 성공"); 

		return "";
	}
	
	
	
	@PostMapping("/registration/third")
	public String singlefileupload(RegistrationDto dto, MultipartFile update_file ,MultipartFile img_loc_file, HttpServletRequest request ) {
		
		//update 썸네일 where dto.getBoard_no
		String path = upload(update_file, request);
		dto.getBoard_no();
		dto.setThumbnail(path);
		service.update(dto);
		path = upload(img_loc_file, request);
		dto.setImg_loc(path);
		List<RegistrationDto> rlist = service.insert2();
		System.out.println("저장 성공"); 
		return "/main";
	}
	
	 @RequestMapping(value = "/registration/third")
	private String picture(MultipartFile update_file, HttpServletRequest request) {
		String origName = update_file.getOriginalFilename();
		int index = origName.lastIndexOf(".");
		String ext = origName.substring(index + 1);// 파일 확장자 저장

		Random r = new Random();
		String fileName = System.currentTimeMillis() + "_" + r.nextInt(50) + "." + ext;

		try {
			String path = request.getServletContext().getRealPath("/room_images");
			File f = new File(path, fileName);
			update_file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	 
	
}
