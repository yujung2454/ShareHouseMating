package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.CommunityDao;
import com.sharehouse.dto.CommunityDto;



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
	
	public int updatePost(CommunityDto dto) {
		return dao.updatePost(dto);
	}
	
	public int deletePost(int no) {
		return dao.deletePost(no);
	}
	
	public CommunityDto viewPost(int comm_no) {
		return dao.viewPost(comm_no);
	}
	
	public List<CommunityDto> communityList(int start){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.communityList(m);
	}
	
	
}