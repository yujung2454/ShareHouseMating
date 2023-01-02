package com.sharehouse.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
		m.addAttribute("lat", lat);
		m.addAttribute("lng", lng);
		double dlat = Double.parseDouble(lat);
		double dlng = Double.parseDouble(lng);
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		String[] arr = loc.split(" ");
		if (arr.length-1 < 3) {
			List<Map<String,Object>> olist = sservice.searchedoffer(arr[arr.length-1]);
			for(Map<String,Object> offering : olist) {
				double latitude = Double.parseDouble((String)offering.get("latitude"));
				double longitude = Double.parseDouble((String)offering.get("longitude"));
				double distance = Math.sqrt(Math.pow((dlat - latitude),2) + Math.pow((dlng - longitude),2));
				offering.put("distance", distance);
				String add2 = (String)offering.get("offering_add2");
				String[] arr2 = add2.split(" ");
				offering.put("dong", arr2[2]);
			}
			olist = olist.stream().sorted((o1,o2) -> Double.compare((double)o1.get("distance"), (double)o2.get("distance"))).collect(Collectors.toList());
			m.addAttribute("offering",olist);
		} else {
			List<Map<String,Object>> olist = sservice.searchedoffer(arr[3]);
			for(Map<String,Object> offering : olist) {
				double latitude = Double.parseDouble((String)offering.get("latitude"));
				double longitude = Double.parseDouble((String)offering.get("longitude"));
				double distance = Math.sqrt(Math.pow((dlat - latitude),2) + Math.pow((dlng - longitude),2));
				offering.put("distance", distance);
				String add2 = (String)offering.get("offering_add2");
				String[] arr2 = add2.split(" ");
				offering.put("dong", arr2[2]);
			}
			olist = olist.stream().sorted((o1,o2) -> Double.compare((double)o1.get("distance"), (double)o2.get("distance"))).collect(Collectors.toList());
			m.addAttribute("offering",olist);
		}

		return "/search/searchloc";
	}
	
	@GetMapping("/search/searchlist")
	public String search(@AuthenticationPrincipal SecurityUser user,Model m,String latitude, String longitude) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		List<Map<String, Object>> olist = service.offering();
		double dlat = Double.parseDouble(latitude);
		double dlng = Double.parseDouble(longitude);
		for(Map<String,Object> offering : olist) {
			double lat = Double.parseDouble((String)offering.get("latitude"));
			double lng = Double.parseDouble((String)offering.get("longitude"));
			double distance = Math.sqrt(Math.pow((dlat - lat),2)+Math.pow((dlng-lng),2));
			offering.put("distance", distance);
			String add2 = (String)offering.get("offering_add2");
			String[] arr = add2.split(" ");
			offering.put("dong", arr[2]);
		}
		olist = olist.stream().sorted((o1,o2) -> Double.compare((double)o1.get("distance"), (double)o2.get("distance"))).collect(Collectors.toList());
		m.addAttribute("offering",olist);
		Gson gson = new Gson();
		m.addAttribute("offering2",gson.toJson(olist));
		return "/search/searchlist";
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
		Gson gson = new Gson(); 
		List<String> alist = aservice.address(add1, add2);
		m.addAttribute("add3", alist);
		
		return gson.toJson(alist);
	}
	
	@GetMapping("/detailresult")
	public String detailresult(@AuthenticationPrincipal SecurityUser user,Model m,String region,String kind,int contract,int pay,String[] gender) {
		if(user == null) {
			m.addAttribute("user",null);
		}else {
			m.addAttribute("user",user.getUsers());
		}
		String gen = null;
		if(gender[0] != "n") {
			if(gender.length == 1) {
				if(gender[0] == "m") {
					gen = "m";
				} else {
					gen = "f";
				}
			} else if(gender.length == 2) {
				gen = "a";
			}
		} else {
			gen = "n";
		}
		
		List<Map<String,Object>> olist = sservice.dresult(region,kind,contract,pay,gen);
		double dlat = 37.5866076;
		double dlng = 126.974811;
		for(Map<String,Object> offering : olist) {
			double lat = Double.parseDouble((String)offering.get("latitude"));
			double lng = Double.parseDouble((String)offering.get("longitude"));
			double distance = Math.sqrt(Math.pow((dlat - lat),2)+Math.pow((dlng-lng),2));
			offering.put("distance", distance);
			String add2 = (String)offering.get("offering_add2");
			String[] arr = add2.split(" ");
			offering.put("dong", arr[2]);
		}
		olist = olist.stream().sorted((o1,o2) -> Double.compare((double)o1.get("distance"), (double)o2.get("distance"))).collect(Collectors.toList());
		m.addAttribute("offering",olist);
		m.addAttribute("lat",dlat);
		m.addAttribute("lng",dlng);
		System.out.println(region);
		return "/search/detailresult";
	}
	
}
