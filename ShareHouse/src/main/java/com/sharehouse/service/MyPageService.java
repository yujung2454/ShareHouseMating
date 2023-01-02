package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.MyPageDao;
import com.sharehouse.dto.CommunityDto;

@Service
public class MyPageService {
	
	@Autowired
	MyPageDao dao;
	
	
	public List<CommunityDto> MyCommunityList(String id, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("id", id);
		m.put("start", start);
		m.put("count", 10);
		return dao.MyCommunityList(m);
	}
	
	public int count() {
		return dao.count();
	}
}
