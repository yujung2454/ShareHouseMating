package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.CommunityDto;

@Mapper
public interface MyPageDao {

	@Select
	("select * from comm where id = #{user.id}")
	List<CommunityDto> MyCommunityList(Map<String, Object> m);
	
	@Select
	("select count(*) from comm where id = #{user.id}")
	int count();
}
