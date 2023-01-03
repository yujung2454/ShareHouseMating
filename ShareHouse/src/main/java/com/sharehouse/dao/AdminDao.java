package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sharehouse.dto.UsersDto;
import com.sharehouse.dto.AdminDto;

@Mapper
public interface AdminDao {
	
	List<AdminDto> commviewlist(Map<String, Object> m);
	List<AdminDto> boardviewlist(Map<String, Object> m);
	int countSearch(Map<String, Object> m); // 전체 글 갯수
	List<AdminDto> Sort(Map<String, Object> m);
	int count();
	
	@Select
	("select * from user limit #{start} , #{count}")
	List<UsersDto> userList(Map<String , Object> m);
	

	List<UsersDto> search(Map<String , Object> m);
	
	@Select
	("select count(*) from user")
	int countUser();

	int stopUser(String[] id);
	
	int delCheck(String[] id);
	
	int release(String [] id);
	
	@Insert
	("insert into visit (v_date) values (now())")
	int setVisitTotalCount();
	
	@Select
	("select count(*) from visit")
	int getVisitTotalCount();
	
	@Select
	("select count(*) from visit where format(v_date, 'YYYY-MM-DD') = format(now(), 'YYYY-MM-DD')")
	int getVisitTodayCount();

}
