package com.sharehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.ReportDao;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.ReportDto;

@Service
public class ReportService {

	@Autowired
	ReportDao dao;
	
	public OfferingDto selectNo(int board_no) {
		return dao.selectNo(board_no);
	}
	
	public int insertReport(ReportDto dto) {
		return dao.insertReport(dto);
	}
	
	public OfferingDto selectIdNo(int board_no) {
		return dao.selectIdNo(board_no);
	}
}
