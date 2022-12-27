package com.sharehouse.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


import com.sharehouse.domain.Users;



@Mapper
public interface UserDao {
@Select
("select * from user where id = #{id}")
Users findById(String id);

@Insert
("insert into user values(#{id}, #{pwd}, #{name}, #{email}, #{tel}, #{gender}, #{user_add}, #{user_add2}, #{user_Img}, #{status})")
int insertUser(Users user);

/*
 * @Select ("select id from member where email = #{email}") List<String>
 * findByEmail(String email);
 */
}