package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.SearchOfferingDao;

@Service
public class SearchOfferingService {

	@Autowired
	SearchOfferingDao dao;
	
	public List<Map<String, Object>> searchedoffer(String loc){
		return dao.searchedoffer(loc);
	}

	public List<Map<String, Object>> latlng(){
		return dao.latlng();
	}
	
	public List<Map<String, Object>> dresult(String region, String kind, int contract, int pay, String gen){
		Map<String, Object> map = new HashMap<>();
		map.put("region", region);
		map.put("kind", kind);
		map.put("contract", contract);
		map.put("pay", pay);
		map.put("gen", gen);
		
		return dao.dresult(map);
	}
}
