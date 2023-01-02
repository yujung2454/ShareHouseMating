package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AddressDao {

	@Select("select add3 from address where add1 = #{add1} and add2 like concat(#{add2},'%') order by add3 asc")
	List<String> address(Map<String, String> map);
}
