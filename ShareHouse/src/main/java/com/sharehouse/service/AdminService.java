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
		m.put("count", 5);
		return dao.userList(m);
	}
	
	public List<UsersDto> search(String search, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("search", search);
		m.put("start", start);
		m.put("count", 5);
		return dao.search(m);
	}
	
	public int count() {
		return dao.count();
	}
	public int countSearch(String search) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("search", search);
		return dao.countSearch(m);
	}


	public int stopUser(String[] id) {
		return dao.stopUser(id);
	}
	public int delCheck(String[] id) {
		return dao.delCheck(id);
	}
	public int release(String[] id) {
		return dao.release(id);
	}
}
