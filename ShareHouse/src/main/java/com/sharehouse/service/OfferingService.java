package com.sharehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.OfferingDao;
import com.sharehouse.dto.OfferingDto;

@Service
public class OfferingService {

	@Autowired
	OfferingDao dao;
	
	public OfferingDto selectNo(int board_no) {
		return dao.selectNo(board_no);
	}
}
