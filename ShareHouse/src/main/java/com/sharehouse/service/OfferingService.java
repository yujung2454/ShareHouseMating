package com.sharehouse.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sharehouse.dao.OfferingDao;
import com.sharehouse.dto.OfferingDto;
import com.sharehouse.dto.RoomImgDto;

@Service
public class OfferingService {

	@Autowired
	OfferingDao dao;
	
	public OfferingDto selectNo(int board_no) {
		dao.addReadCount(board_no);
		return dao.selectNo(board_no);
	}
	
	public Map<String, Object> SelectRoom(int board_no){ 
		return dao.selectRoom(board_no); 
	}
	
	public String drawing(int board_no){
		return dao.drawing(board_no);
	}
	 
	public List<Map<String, Object>> roominfoTable(int board_no){
		return dao.roominfoTable(board_no);
	}
	
	public List<String> room_name(int board_no){
		return dao.room_name(board_no);
	}
	
	public List<String> img_loc(int board_no, String room_name){
		Map<String, Object> map = new HashMap<>();
		map.put("board_no", board_no);
		map.put("room_name", room_name);
		
		return dao.img_loc( map);
	}
	
	public int apply(String id, int board_no, String room_name) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("board_no", board_no);
		map.put("room_name", room_name);
		return dao.apply(map);
	}
	
	public int delete_board(int board_no) {
		return dao.delete_board(board_no);
	}
	
	public int wish(int board_no, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("board_no", board_no);
		map.put("id", id);
		return dao.wish(map);
		
	}
	
	
}
