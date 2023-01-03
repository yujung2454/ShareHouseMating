package com.sharehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.UserModifyDao;
import com.sharehouse.dto.UsersDto;

@Service
public class UserModifyService {

	@Autowired
	UserModifyDao dao;
	
	public int userModify(UsersDto dto) {
		return dao.userModify(dto);
	}
	
	public UsersDto selectUser(String id) {
		return dao.selectUser(id);
	}
}
