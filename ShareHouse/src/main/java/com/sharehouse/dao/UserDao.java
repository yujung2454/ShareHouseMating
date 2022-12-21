package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.domain.Users;



@Mapper
public interface UserDao {
	
@Select
("select * from user where id = #{id}")
Users findById(String id);

@Insert("insert into user values(#{id}, #{pwd}, #{name}, #{email}, #{tel}, #{gender}, #{user_add}, #{user_add2}, #{user_Img}, #{status})")
int insertUser(Users user);

@Select
("select o.title, o.offering_add, o.latitude, o.longitude, r.deposit, r.rental, r.square, o.thumbnail from offering o inner join room_info r on o.board_no = r.board_no order by o.v_cnt desc limit 20")
List<Map<String, Object>> offering();

/*
 * @Select ("select id from member where email = #{email}") List<String>
 * findByEmail(String email);
 */
}