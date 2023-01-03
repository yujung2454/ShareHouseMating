package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.MyPageDao;
import com.sharehouse.dto.CommentDto;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.OfferingDto;

@Service
public class MyPageService {
	
	@Autowired
	MyPageDao dao;
	
	
	public List<CommunityDto> MyCommunityList(String id, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("id", id);
		m.put("start", start);
		m.put("count", 5);
		return dao.MyCommunityList(m);
	}
	
	public List<OfferingDto> MyOfferingList(String id, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("id", id);
		m.put("start", start);
		m.put("count", 5);
		return dao.MyOfferingList(m);
	}
	
	public List<CommentDto> MyCommentList(String id, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("id", id);
		m.put("start", start);
		m.put("count", 5);
		return dao.MyCommentList(m);
	}
	public int comm_count(String id) {
		return dao.comm_count(id);
	}
	public int comment_count(String id) {
		return dao.comment_count(id);
	}
	public int offer_count(String id) {
		return dao.offer_count(id);
	}
//	public int count(String id) {
//		return dao.count(id);
//	}
}
