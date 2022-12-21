package com.sharehouse.service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.sr.eapp.dao.EappDao;
import com.work.sr.eapp.dto.EappDto;


@Service
public class EappService {
	
	@Autowired
	EappDao dao;
	
	public List<Map<String, Object>> signer(){
		return dao.signer();
	}
	
	public List<Map<String, Object>> signer2(int empno){
		return dao.signer2(empno);
	}
	
	public int insert(EappDto dto) {
		dto.setEmpno(1234); // 이후 세션 생기면 변경해야함 
		Date d = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	    dto.setDraftdt(sdf.format(d));
		return dao.insert(dto);
	}
	
	public int count() {
		return dao.count();
	}
	
	public List<EappDto> list(int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("start", start);
		m.put("count", 10);
		return dao.list(m);
	}
	
	public EappDto listOne(int opno) {
		return dao.listOne(opno);
	}
	
	public int updateEapp(EappDto dto) {
		return dao.updateEapp(dto);
	}
	
	public int delete(int opno) {
		return dao.delete(opno);
	}
	
	public List<EappDto> signlist(int empno) {
		return dao.signlist(empno);
	}
	
	public List<EappDto> permission() {
		return dao.permission();
	}
	
	public List<EappDto> waiting() {
		return dao.waiting();
	}
	
	public List<EappDto> reject() {
		return dao.reject();
	}
	
	public int signdone(int opno) {
		return dao.signdone(opno);
	}
	
	public int returnsign(int opno) {
		return dao.returnsign(opno);
	}
	
	public int outbox(EappDto dto) {
		dto.setEmpno(1234); // 이후 세션 생기면 변경 
		return dao.outbox(dto);
	}
	
	public List<EappDto> outboxpage() {
		return dao.outboxpage();
	}
	public List<EappDto> EappSearch(int searchn, String search, int start){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		m.put("start", start);
		m.put("count", 10);
		return dao.EappSearch(m);
	}
	public int countSearch(int searchn, String search) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("searchn", searchn);
		m.put("search", search);
		return dao.countSearch(m);
	}
	
	public int rejectcont(EappDto dto){
		return dao.rejectcont(dto); //반려사유 기입 페이지
	}
}
