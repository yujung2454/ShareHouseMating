package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.AddressDao;

@Service
public class AddressService {

	@Autowired
	AddressDao dao;
	
	public List<String> address(String add1, String add2){
		Map<String, String> map = new HashMap<>();
		map.put("add1", add1);
		map.put("add2", add2);
		
		return dao.address(map);
	}
}
