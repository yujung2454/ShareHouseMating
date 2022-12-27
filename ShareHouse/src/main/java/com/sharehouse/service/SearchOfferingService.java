package com.sharehouse.service;

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
}
