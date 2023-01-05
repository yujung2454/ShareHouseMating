package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sharehouse.dto.UsersDto;

@Mapper
public interface UserDao {
	
@Select
("select * from user where id = #{id}")
UsersDto findById(String id);	

@Insert
("insert into user(id,pwd,name,email,tel,gender,user_add,user_add2,status) values(#{id}, #{pwd}, #{name}, #{email}, #{tel}, #{gender}, #{user_add}, #{user_add2},'ROLE_MEMBER')")
int insertUser(UsersDto users);

@Select
("select id from user where id =#{id}")
String idCheck(String id);

@Select
("select o.board_no, o.title, o.offering_add, o.offering_add2, o.latitude, o.longitude, r.deposit, r.rental, r.square, o.thumbnail from offering o inner join room_info r on o.board_no = r.board_no group by o.board_no order by o.v_cnt desc limit 20")
List<Map<String, Object>> offering();

@Select("select email from user where name = #{name} and email = #{email}") 
String findByEmail(Map<String, String> map); 
 
@Select("select id from user where name = #{name} and email = #{email}")
String findByEmail2(Map<String, String> map);

@Select
("select email from user where name = #{name} and email = #{email} and id = #{id}")
String findById2(UsersDto users);

@Update
("update user set pwd = #{pwd} where id = #{id}")
int updateUser(Map<String, String> map);
}