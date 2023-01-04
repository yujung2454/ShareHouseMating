package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.CommentDto;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.OfferingDto;
import org.apache.ibatis.annotations.Mapper;

import com.sharehouse.dto.MyPageDto;

@Mapper
public interface MyPageDao {
	List<MyPageDto> apply(String id);

	int delete(int myno);
	int state(Map<String, Object> m);

	@Select
	("select * from comm where id = #{id} limit #{start} , #{count}")
	List<CommunityDto> MyCommunityList(Map<String, Object> m);
	
	@Select
	("select * from offering where id = #{id} limit #{start} , #{count}")
	List<OfferingDto> MyOfferingList(Map<String, Object> m);
	
	@Select
	("select * from comm_comment where id = #{id} limit #{start} , #{count}")
	List<CommentDto> MyCommentList(Map<String, Object> m);
	
	@Select
	("select count(*) from comm where id = #{id}")
	int comm_count(String id);
	
	@Select
	("select count(*) from offering where id = #{id}")
	int offer_count(String id);
	
	@Select
	("select count(*) from comm_comment where id = #{id}")
	int comment_count(String id);
	
//	@Select
//	("select((select count(*) from comm where id=#{id}) + (select count(*) from offering where id = #{id}))")
//	int count(String id);

}
