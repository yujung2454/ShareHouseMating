package com.sharehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.AllBoardViewDao;
import com.sharehouse.dto.AllBoardViewDto;

@Service
public class AllBoardViewService {
	
	@Autowired
	AllBoardViewDao dao;
	
	public int viewpost (AllBoardViewDto dto) {
		return dao.viewpost(dto);
	}
	
	
	}

