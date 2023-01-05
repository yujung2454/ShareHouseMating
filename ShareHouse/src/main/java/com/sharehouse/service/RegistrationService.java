package com.sharehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.RegistrationDao;
import com.sharehouse.dto.RegistrationDto;

@Service
public class RegistrationService {
	
	@Autowired
	RegistrationDao dao;
	
	public int insert (RegistrationDto dto) {
		return dao.insert(dto);
	}
	
	public int update (RegistrationDto dto) {
		return dao.update(dto);
	}
	
	public List<RegistrationDto> select (int board_no) {
		return dao.select(board_no);
	}
	
	public int insert2 (RegistrationDto dto) {
		return dao.insert2(dto);
	}
	
	public List<RegistrationDto> fileList(){
		return dao.fileList();
	}

	public int selectBoardno(String id) {
		return dao.selectBoardno(id);
	}


}
