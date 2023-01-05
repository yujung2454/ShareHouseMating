package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.ReportDao;
import com.sharehouse.dto.CommentDto;
import com.sharehouse.dto.CommunityDto;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.ReportDto;
import com.sharehouse.dto.UsersDto;

@Service
public class ReportService {

	@Autowired
	ReportDao dao;
	
	// 매물 신고
	public OfferingDto selectNo(int board_no) {
		return dao.selectNo(board_no);
	}
	
	public int insertReport(ReportDto dto) {
		return dao.insertReport(dto);
	}
	
	public OfferingDto selectIdNo(int board_no) {
		return dao.selectIdNo(board_no);
	}
	
	// 커뮤니티 신고
	public CommunityDto selectNo2(int comm_no) {
		return dao.selectNo2(comm_no);
	}
	
	public int insertReport2(ReportDto dto) {
		return dao.insertReport2(dto);
	}
	
	public CommunityDto selectIdNo2(int comm_no) {
		return dao.selectIdNo2(comm_no);
	}
	
	// 댓글 신고
	public CommentDto selectNo3(int comment_no) {
		return dao.selectNo3(comment_no);
	}
	
	public int insertReport3(ReportDto dto) {
		return dao.insertReport3(dto);
	}
	
	public CommentDto selectIdNo3(int comment_no) {
		return dao.selectIdNo3(comment_no);
	}
	
	// 관리자
	public List<ReportDto> selectAll() {
		return dao.selectAll();
	}
	
	public int deleteuser(String reported_id) {
		return dao.deleteuser(reported_id);
	}
	
	public int updateuser(String reported_id) {
		return dao.updateuser(reported_id);
	}
	
	public String selectSta() {
		return dao.selectSta();
	}
	
	public int delChecked(int[] report_no) {
		return dao.delChecked(report_no);
	}
	
	public int count() {
		return dao.count();
	}
	
	public List<ReportDto> reportList(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 5);
		return dao.reportList(m);
	}
}
