package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dao.CommunityDao;

@Service
public class CommunityService {

	@Autowired
	CommunityDao dao;
	
	public int insert (CommunityDto dto) {
		return dao.insert(dto);
	}
	
	public int count() {
		return dao.count();
	}
	
	public CommunityDto communityOne(int no) {
		dao.addReadcount(no);
		return dao.communityOne(no);
	}
	
	
	public int updatePost(CommunityDto dto) {
		return dao.updatePost(dto);
	}
	
	public int deletePost(int no) {
		return dao.deletePost(no);
	}
	
	public List<CommunityDto> communityList(String sort, int start){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("sort", sort);
		m.put("start", start);
		m.put("count", 10);
		return dao.communityList(m);
	}
	
	public List<CommunityDto> communityListSearch(String sort, String search,int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("sort", sort);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.communityListSearch(m);
	}
	
	public int countSearch(String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("search", search);
		return dao.countSearch(m);
	}
	

}
