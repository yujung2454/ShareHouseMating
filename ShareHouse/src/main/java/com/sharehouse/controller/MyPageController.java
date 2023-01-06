package com.sharehouse.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sharehouse.config.SecurityUser;
import com.sharehouse.dto.CommentDto;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.MyPageDto;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.UsersDto;
import com.sharehouse.service.MyPageService;
import com.sharehouse.service.UserModifyService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService service;
 	@Autowired
	UserModifyService sservice;
  	
  
	@RequestMapping(value= "/mypage/application", method = RequestMethod.GET)
	public String application(@AuthenticationPrincipal SecurityUser user, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		String id = user.getUsers().getId();
		System.out.println(id);
		List<MyPageDto> dto = service.apply(id);
		m.addAttribute("cList", dto);
		return "mypage/application";
	}
	//입주 거절
	@GetMapping("/mypage/application/cancel")
	public String deletepost(Model m, int myno) {
		service.delete(myno);
		return "redirect:/mypage/application";
	}
	

	//입주 승인
	@PostMapping("/mypage/application")
	public String updatepost(Model m, int myno, int board_no, String room_name) {
		service.state(room_name, board_no);
		service.delete(myno);
		return "redirect:/mypage/application";
	}
	

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

	


	@GetMapping("/mypage/myPage_community")
	public String community(@AuthenticationPrincipal SecurityUser user, @RequestParam(name="p", defaultValue="1") int page, Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
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
		
		List<CommentDto> CommentList = service.MyCommentList(id, startRow);
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
		

		return "mypage/myPage_community";
	}
	
	@GetMapping("/mypage/mywish")
	public String mywish(@AuthenticationPrincipal SecurityUser user, Model m,@RequestParam(name="p",defaultValue="1")int page) {
		if(user == null) {
			m.addAttribute("user",null);
		} else {
			m.addAttribute("user", user.getUsers());
		}
		
		String id = user.getUsers().getId();
		int count = service.mywishCount();
;		if(count > 0) {
			int perPage = 5;
			int startRow = (page - 1) * perPage;
			List<Map<String, Object>> mywish = service.mywish(id, startRow);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0);
			int begin = (page - 1) / pageNum * pageNum + 1;
			System.out.println(begin);
			int end = begin + pageNum - 1;
			int index = 0;
			for(Map<String, Object> record : mywish) {
				record.put("index", begin + index);
				index++;
			}
			m.addAttribute("mywish",mywish);
			
			if(end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("beggin",begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum",pageNum);
			m.addAttribute("totalPages",totalPages);
		}
		m.addAttribute("count",count);
		
		return "/mypage/mywish";

	}
}

