package com.sharehouse.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sharehouse.config.SecurityUser;
import com.sharehouse.service.AddressService;
import com.sharehouse.service.SearchOfferingService;
import com.sharehouse.service.UserService;

@Controller
public class SearchController {

	@Autowired
	UserService service;
	
	@Autowired
	AddressService aservice;
	
	@Autowired
	SearchOfferingService sservice;
	
	@RequestMapping("/latlng")
	@ResponseBody
	public List<Map<String, Object>> latlng(){
		List<Map<String, Object>> location = sservice.latlng();
		return location;
	}
	
	@GetMapping("/search")//loc는 매물 꺼내는 용도, lat과 lng는 지도 위치 세팅
	public String querysearch(Model m, String loc,@AuthenticationPrincipal SecurityUser user,String latlng) {
		String lat = latlng.substring(1, latlng.indexOf(","));
		String lng = latlng.substring(latlng.indexOf(",")+2,latlng.indexOf(")"));
		Gson gson = new Gson();
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		List<Map<String,Object>> olist = sservice.searchedoffer(loc);
		m.addAttribute("offering", olist);
		
		m.addAttribute("lat", lat);
		m.addAttribute("lng", lng);

		return "/search/searchloc";
	}
	
	
	@GetMapping("/detailsearch")
	public String detailSearch(@AuthenticationPrincipal SecurityUser user,Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
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
	public String search(@AuthenticationPrincipal SecurityUser user,Model m) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		List<Map<String, Object>> offering = service.offering();
		m.addAttribute("offering",offering);
		Gson gson = new Gson();
		m.addAttribute("offering2",gson.toJson(offering));
		return "/search/searchlist";
	}
	
}
