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
		return dao.selectNo(board_no);
	}
	
	public Map<String, Object> SelectRoom(int board_no){ 
		return dao.selectRoom(board_no); 
	}
	 
	public List<Map<String, Object>> roominfoTable(int board_no){
		return dao.roominfoTable();
	}
	
	public List<RoomImgDto> room_name(){
		return dao.room_name();
	}
	
	public List<Map<String, Object>> img_loc(int board_no){
		return dao.img_loc();
	}
}
