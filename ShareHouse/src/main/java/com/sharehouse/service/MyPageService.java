package com.sharehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.MyPageDao;
import com.sharehouse.dto.MyPageDto;

@Service
public class MyPageService {
	
	@Autowired
	MyPageDao dao;
	
	public List<MyPageDto> apply(String id) {
		return dao.apply(id);
	}
	
	public List<MyPageDto> room(String id) {
		return dao.room(id);
	}
	
	public int delete(String id) {
		return dao.delete(id);
	}
	

	
}
