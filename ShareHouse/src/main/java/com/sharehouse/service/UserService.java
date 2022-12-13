package com.sharehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


import com.sharehouse.dao.UserDao;
import com.sharehouse.domain.Role;
import com.sharehouse.domain.Users;
import com.sharehouse.dto.CommunityDto;

@Service
public class UserService {
	
	@Autowired
	UserDao dao;
	
	@Autowired
	private PasswordEncoder encoder; //암호화 객체 주입 받음
	
	public int insertUser(Users users) { //Users : form에 입력한 값들 저장되어 있음
		
		//암호화(BCrypt 알고리즘 )
		users.setPwd(encoder.encode(users.getPwd())); // 암호화된 pwd를 다시 set(저장)
	
		users.setStatus(Role.ROLE_MEMBER);
		
		int i = dao.insertUser(users);
		System.out.println(i);
		
		return i;
	}
	
	public List<CommunityDto> comm(){
	return dao.comm();
	}
}
