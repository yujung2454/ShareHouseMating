package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.AdminDto;
import com.sharehouse.dto.UsersDto;

@Mapper
public interface AdminDao {
	
	@Select
	("select comm_no,id,comm_title,comm_v_cnt from comm limit #{start} , #{count}")
	List<AdminDto> commviewlist(Map<String, Object> m);
	
	@Select
	("select board_no,id,title,v_cnt from offering limit #{start} , #{count}")
	List<AdminDto> boardviewlist(Map<String, Object> m);

	
	@Select
	("select count(*) from comm c inner join offering o on c.id = o.id ")
	int count();
	
	@Select
	("select * from user limit #{start} , #{count}")
	List<UsersDto> userList(Map<String , Object> m);
	
	@Select
	("select * from user where id like concat('%' , #{search} , '%') limit #{start} , #{count}")
	List<UsersDto> search(Map<String , Object> m);

	@Select
	("select count(*) from user")
	int countUser();
	
	@Select
	("select count(*) from user where id like concat('%', #{search} , '%')")
	int countSearch(Map<String, Object> m);


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
