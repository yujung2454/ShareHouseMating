package com.sharehouse.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.PopupDto;

@Mapper
public interface PopupDao {

	@Insert("insert into popup(pop_title, pop_img) values (#{pop_title},#{pop_img})")
	int preview(Map<String, Object> map);
	
	@Select("select * from popup order by pop_no desc limit 1")
	PopupDto popup();
}
