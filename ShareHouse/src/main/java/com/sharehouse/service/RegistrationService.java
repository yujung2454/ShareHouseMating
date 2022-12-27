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
	
	public int insert2 (RegistrationDto dto) {
		return dao.insert2(dto);
	}
	
	public int insert3 (RegistrationDto dto) {
		return dao.insert3(dto);
	}
	
	public List<RegistrationDto> fileList(){
		return dao.fileList();
	}

}
