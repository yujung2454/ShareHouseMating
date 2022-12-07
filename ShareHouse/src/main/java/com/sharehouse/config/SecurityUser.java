package com.sharehouse.config;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.sharehouse.domain.Users;

//로그인하면 세션에 정보를 저장시키는 클래스
public class SecurityUser extends User {
	private static final long serialVersionUID = 1L;

	private Users users; //유저를 통째로 저장 -> dto타입으로 변수 선언
	
	public SecurityUser(Users users) { 
		super(users.getId(),
				 "{noop}"+ users.getPwd(), //noop은 암호화되지 않은 비밀번호를 받아옴
				AuthorityUtils.createAuthorityList(users.getStatus().toString()));
		// id, pwd, status를 권한 리스트(createAuthorityList)에 추가
		this.users = users; //로그인 성공했을 때 정보를 users객체 에 저장
	}//정보가 세션에 저장. jsp에서 꺼내쓰면 됨

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Users getUsers() { //저장한 정보를 꺼내씀
		return users;
	}
	
	
}
