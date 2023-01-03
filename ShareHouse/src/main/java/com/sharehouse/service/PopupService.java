package com.sharehouse.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.PopupDao;
import com.sharehouse.dto.PopupDto;

@Service
public class PopupService {

	@Autowired
	PopupDao dao;
	
	public int preview(Map<String, Object> map) {
		return dao.preview(map);
		
	}
	
	public PopupDto popup() {
		return dao.popup();
	}
}
