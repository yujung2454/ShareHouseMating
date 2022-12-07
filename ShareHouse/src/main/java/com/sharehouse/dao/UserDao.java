package com.sharehouse.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;


import com.sharehouse.domain.Users;



@Mapper
public interface UserDao {
@Select
("select * from user where id = #{Id}")
Users findById(String id);

@Insert("insert into user values(#{Id}, #{Pwd}, #{Name}, #{Email}, #{Tel}, #{Gender}, #{User_add}, #{User_add2}, #{User_Img}, #{Status})")
int insertUser(Users user);
}
