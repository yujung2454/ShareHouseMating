package com.sharehouse.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.UserDao;
import com.sharehouse.domain.Role;

import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.UsersDto;


@Service
public class UserService {
	
	@Autowired
	UserDao dao;
	
	@Autowired
	private PasswordEncoder encoder; //암호화 객체 주입 받음
	
	public int insertUser(UsersDto users) { //Users : form에 입력한 값들 저장되어 있음
		
		//암호화(BCrypt 알고리즘 )
		//users.setPwd(encoder.encode(users.getPwd())); // 암호화된 pwd를 다시 set(저장)
	
		//users.setStatus(Role.ROLE_MEMBER);
		
		return dao.insertUser(users);
	}
	
	public String idCheck(String id) {
		return dao.idCheck(id);
	}
		
	public String findByEmail(Map<String, String> map) {
		return dao.findByEmail(map);
	}
	
	public String findByEmail2(Map<String, String> map) {
		return dao.findByEmail2(map);
	}
	
	public String findById2(UsersDto users) {
		return dao.findById2(users);
	}
	
	public void updateUser(Map<String, String> map) {
		 dao.updateUser(map);
	}

	public List<Map<String, Object>> offering(){
		return dao.offering();
	}
}
