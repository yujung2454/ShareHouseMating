package com.sharehouse.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.UserDao;
import com.sharehouse.dto.UsersDto;


@Service
public class BoardUserDetailsService implements UserDetailsService {

	@Autowired // 객체 주입, 주입받은 객체의 메서드 사용가능
	private UserDao userDao; 

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UsersDto user = userDao.findById(username); //username에 id값을 저장하고 user에 저장
		if (user == null) {
			throw new UsernameNotFoundException(username + " 사용자 없음");
		} else {
			return new SecurityUser(user); //user에 저장된 값 들고가서 SecurityUser객체 생성
		}
	}
}