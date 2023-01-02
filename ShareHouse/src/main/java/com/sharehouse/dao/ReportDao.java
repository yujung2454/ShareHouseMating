package com.sharehouse.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.ReportDto;

@Mapper
public interface ReportDao {

@Insert
("insert into user_report_board(reporter, reported_id, category, report_con, board_no) values(#{reporter}, #{reported_id}, #{category}, #{report_con}, 1)")//#{board_no}
int insertReport(ReportDto dto);

@Select
("select id, board_no from offering where board_no = 1") //#{board_no}
OfferingDto selectIdNo();	//int board_no
}
