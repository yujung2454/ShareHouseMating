package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.WishDao;
import com.sharehouse.dto.WishDto;


@Service
public class WishService {
	
	@Autowired
	WishDao dao;
	
	public int count() {
		return dao.count();
	}
	
	public List<WishDto> wishList(int start){
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.wishList(m);
	}
	
	public int delChecked(int[] board_no) {
		return dao.delChecked(board_no);
	}
	
	public String selectTitle() {
		return dao.selectTitle();
	}
}
