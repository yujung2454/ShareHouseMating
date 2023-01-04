package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.WishDao;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.WishDto;


@Service
public class WishService {
	
	@Autowired
	WishDao dao;
	
	public int count(String id) {
		return dao.count(id);
	}
	
	public List<WishDto> wishList(int start, String id){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		m.put("id", id);
		return dao.wishList(m);
	}
	
	public int delChecked(int[] board_no) {
		return dao.delChecked(board_no);
	}
	
	public List<OfferingDto> selectTitle(String id, int start) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		m.put("id", id);
		return dao.selectTitle(m);
	}
}
