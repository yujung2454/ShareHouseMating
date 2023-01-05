package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.QueryDto;
import com.sharehouse.dao.QueryDao;

@Service
public class QueryService {

	@Autowired
	QueryDao dao;
	
	//유저 service
	public int insert (QueryDto dto) {
		return dao.insert(dto);
	}
	
	public int count() {
		return dao.count();
	}
	
	public QueryDto queryOne(int query_no) {
		return dao.queryOne(query_no);
	}
	
	public int updatePost(QueryDto dto) {
		return dao.updatePost(dto);
	}
	
	public int deletePost(int no) {
		return dao.deletePost(no);
	}
	
	public List<QueryDto> queryList(int start){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.queryList(m);
	}
	
	public List<QueryDto> queryListSearch(String search,int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.queryListSearch(m);
	}
	
	public int countSearch(String search) {
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("search", search);
		return dao.countSearch(m);
	}
	
	public List<QueryDto> querySort(String sort,int start){
		Map<String,Object> m = new HashMap<String, Object>();
		m.put("sort", sort);
		m.put("start", start);
		m.put("count", 10);
		return dao.querySort(m);
	}
	
	public int count2(String id) {
		return dao.count2(id);
	}
	
	public List<QueryDto> queryList2(int start, String id){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		m.put("id", id);
		return dao.queryList2(m);
	}
	//관리자 service
	public int delChecked(int[] query_no) {
		return dao.delChecked(query_no);
	}
	
	public int insertAnswer(QueryDto dto) {
		return dao.insertAnswer(dto);
	}
}
