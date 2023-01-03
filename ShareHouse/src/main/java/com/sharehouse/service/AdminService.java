package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.AdminDao;
import com.sharehouse.dto.AdminDto;


@Service
public class AdminService {
	
	@Autowired
	AdminDao dao;
	
	
	public List<AdminDto> commviewlist(String sort, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		m.put("sort", sort);
		return dao.commviewlist(m);
	}
	
	public List<AdminDto> boardviewlist(String sort, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		m.put("sort", sort);
		return dao.boardviewlist(m);
	}
	
	public int count() {
		return dao.count();
	}
	
}
