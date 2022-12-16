package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.UsersDto;



@Mapper
public interface UserDao {
	
@Insert("insert into user values(#{id}, #{pwd}, #{name}, #{email}, #{tel}, #{gender}, #{user_add}, #{user_add2}, #{user_Img}, #{status})")
int insertUser(UsersDto user);

@Select
("select * from comm")
List<CommunityDto> comm();

@Select("select email from user where name = #{name} and email = #{email}") 
String findByEmail(Map<String, String> map); 
 
@Select("select id from user where name = #{name} and email = #{email}")
String findByEmail2(Map<String, String> map);

@Select
("select email from user where name = #{name} and email = #{email} and id = #{id}")
String findById(UsersDto user);

@Select
("select pwd from user where id = #{id}")
String findById2(String id);

}