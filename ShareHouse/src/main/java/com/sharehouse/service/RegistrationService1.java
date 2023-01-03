package com.sharehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.RegistrationDao1;
import com.sharehouse.dto.OfferingDto;

@Service
public class RegistrationService1 {
	
	@Autowired
	RegistrationDao1 dao;
	
	public int insertMaemul (OfferingDto dto) {
		return dao.insertMaemul(dto);
	}
	
}
