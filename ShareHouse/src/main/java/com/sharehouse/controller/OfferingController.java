package com.sharehouse.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.sharehouse.dto.OfferingDto;
import com.sharehouse.service.OfferingService;
import com.sharehouse.service.UserService;

@Controller
public class OfferingController {

	@Autowired
	OfferingService service;
	
	@GetMapping("/offer/detail_info")
	public String detail_info(/*@PathVariable int board_no,*/ Model m) {   
		/*
		 * List<Map<String, Object>> offeringdto = service.SelectRoom();
		 * m.addAttribute("offeringdto" , offeringdto);
		 */
		return "/offer/detail_info";
	}
	
	@PostMapping("/offer/detail_info/{board_no}")
	   public String info(Model m,@PathVariable int board_no) {   
	      OfferingDto offeringdto = service.selectNo(board_no);
	      m.addAttribute("offeringdto" , offeringdto);
	      return "/report_maemul";
	   }
	
	/*
	 * @GetMapping("/offer/detail_info/{board_no}") public String
	 * detail_info(@PathVariable int board_no, Model m) { return
	 * "offer/detail_info"; }
	 */
}
