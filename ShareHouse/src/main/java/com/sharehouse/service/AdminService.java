package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.AdminDao;
import com.sharehouse.dto.UsersDto;

@Service
public class AdminService {

	@Autowired
	AdminDao dao;
	
	public List<UsersDto> userList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.userList(m);
	}
	
	public List<UsersDto> userListSearch(String search, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.userListSearch(m);
	}
	
	public int count() {
		return dao.count();
	}
	public int countSearch() {
		return dao.countSearch();
	}
}
