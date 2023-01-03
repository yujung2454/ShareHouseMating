package com.sharehouse.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.UsersDto;
import com.sharehouse.service.MyPageService;
import com.sharehouse.service.UserModifyService;

@Controller
public class MyPageController {
	
	@Autowired
	UserModifyService sservice;
	
	@Autowired
	MyPageService service;

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
		sservice.userModify(dto);
		dto = sservice.selectUser(Id);
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

	


	@GetMapping("/myPage/myPage_community")
	public String community(@AuthenticationPrincipal SecurityUser user, @RequestParam(name="p", defaultValue="1") int page, Model m) {
		String id = user.getUsers().getId();
		int comm_count = service.comm_count(id);
		m.addAttribute("user", user.getUsers());
		
		if(comm_count > 0) {
			
			int perPage = 5;
			int startRow = (page - 1) * perPage;
			
			List<CommunityDto> MyCommunityList = service.MyCommunityList(id, startRow);
			m.addAttribute("mList", MyCommunityList);
			System.out.println(MyCommunityList.size());

			
			int pageNum = 5;
			int totalPages = comm_count / perPage + (comm_count % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			 m.addAttribute( "begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			}
		//글이 없을 시
		m.addAttribute("id", id);
		m.addAttribute("count", comm_count);
		
		
			int offer_count = service.offer_count(id);
		
			if(offer_count > 0) {
			
			int perPage = 5;
			int startRow = (page - 1) * perPage;
			
			List<OfferingDto> MyOfferingList = service.MyOfferingList(id, startRow);
			m.addAttribute("oList", MyOfferingList);
			
			int pageNum = 5;
			int totalPages = offer_count / perPage + (offer_count % perPage > 0 ? 1 : 0); //전체 페이지 수
			
			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum -1;
			if(end > totalPages) {
				end = totalPages;
			}
			 m.addAttribute( "begin", begin);
			 m.addAttribute("end", end);
			 m.addAttribute("pageNum", pageNum);
			 m.addAttribute("totalPages", totalPages);
			}
		//글이 없을 시
		m.addAttribute("id", id);
		m.addAttribute("count", offer_count);
		
		
		int comment_count = service.comment_count(id);
		
		if(comment_count > 0) {
		
		int perPage = 5;
		int startRow = (page - 1) * perPage;
		
		List<OfferingDto> CommentList = service.MyOfferingList(id, startRow);
		m.addAttribute("cList", CommentList);
		
		int pageNum = 5;
		int totalPages = comment_count / perPage + (comment_count % perPage > 0 ? 1 : 0); //전체 페이지 수
		
		int begin = (page - 1) / pageNum * pageNum + 1;
		int end = begin + pageNum -1;
		if(end > totalPages) {
			end = totalPages;
		}
		 m.addAttribute( "begin", begin);
		 m.addAttribute("end", end);
		 m.addAttribute("pageNum", pageNum);
		 m.addAttribute("totalPages", totalPages);
		}
	//글이 없을 시
	m.addAttribute("id", id);
	m.addAttribute("count", comment_count);
		
		return "myPage/myPage_community";
	}
}
