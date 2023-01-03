package com.sharehouse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sharehouse.domain.Role;
import com.sharehouse.dto.CommentDto;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.ReportDto;
import com.sharehouse.dto.UsersDto;

import lombok.Delegate;

@Mapper
public interface ReportDao {

// 매물 신고
@Insert
("insert into user_report_board(reporter, reported_id, category, report_con, board_no) values(#{reporter}, #{reported_id}, #{category}, #{report_con}, #{board_no})")
int insertReport(ReportDto dto);

@Select
("select * from offering where board_no = #{board_no} ")
OfferingDto selectNo(int board_no);   

@Select
("select id, board_no from offering where board_no = #{board_no}")
OfferingDto selectIdNo(int board_no);	

// 커뮤니티 신고
@Insert
("insert into user_report_board(reporter, reported_id, category, report_con, comm_no) values(#{reporter}, #{reported_id}, #{category}, #{report_con}, #{comm_no})")
int insertReport2(ReportDto dto);

@Select
("select * from comm where comm_no = #{comm_no} ")
CommunityDto selectNo2(int comm_no);   

@Select
("select id, board_no from comm where comm_no = #{comm_no}")
CommunityDto selectIdNo2(int comm_no);

// 댓글 신고
@Insert
("insert into user_report_board(reporter, reported_id, category, report_con, comment_no) values(#{reporter}, #{reported_id}, #{category}, #{report_con}, #{comment_no})")
int insertReport3(ReportDto dto);

@Select
("select * from comm_comment where comment_no = #{comment_no} ")
CommentDto selectNo3(int comment_no);   

@Select
("select id, comment_no from comm_comment where comment_no = #{comment_no}")
CommentDto selectIdNo3(int comment_no);

// 관리자
@Select
("select * from user_report_board")
List<ReportDto> selectAll();

@Delete
("delete from user where id = #{reported_id}")
int deleteuser(String reported_id);

@Update
("update user set status = 'ROLE_STOP' where id = #{reported_id}")
int updateuser(String reported_id);

@Select
("select status from user u inner join user_report_board r on u.id = r.reported_id")
String selectSta();

int delChecked(int[] report_no);

@Select
("select * from user_report_board limit #{start} , #{count}")
List<ReportDto> reportList(Map<String , Object> m);

@Select
("select count(*) from user_report_board")
int count();
}
