package com.sharehouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sharehouse.service.AddressService;
import com.sharehouse.service.ListService;

@Controller
public class SearchController {

	@Autowired
	AddressService aservice;
	
	@GetMapping("/search")
	public String querysearch(Model m, String query) {
		return "/search/searchlist";
	}
	
	
	@GetMapping("/search/detailsearch")
	public String detailSearch() {
		return "/search/detailsearch";
	}
	
	@GetMapping("/search/detailsearch/{add1}/{add2}")
	@ResponseBody
	public String address(Model m,@PathVariable String add1, @PathVariable String add2) {
		System.out.println(add1 +"  "+add2);
		Gson gson = new Gson(); 
		List<String> alist = aservice.address(add1, add2);
		m.addAttribute("add3", alist);
		
		return gson.toJson(alist);
	}
	
	@GetMapping("/search/searchlist")
	public String search() {
		return "/search/searchlist";
	}
	
}
