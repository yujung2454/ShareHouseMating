package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sharehouse.dto.UsersDto;

@Mapper
public interface AdminDao {

	@Select
	("select * from user limit #{start} , #{count}")
	List<UsersDto> userList(Map<String , Object> m);
	
	@Select
	("select * from user where id like concat('%' , #{search} , '%' limit #{start} , #{count}")
	List<UsersDto> userListSearch(Map<String , Object> m);
	
	@Select
	("select count(*) from user")
	int count();
	@Select
	("select count(*) from user where id like concat('%' , #{search} , '%' limit #{start} , #{count}")
	int countSearch();
	
//	@Update
//	("update user set state='ROLE_STOP' where id = #{id}")
//	List<UsersDto> stop_user();
	
	
	@Update
	("update user set status='ROLE_STOP' where id = #{id}")
	int stop_user(String stop);
	
	@Delete
	("delete from user where id = #{id}")
	int del_user(String id);
}
