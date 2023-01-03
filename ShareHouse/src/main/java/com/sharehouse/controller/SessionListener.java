package com.sharehouse.controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;

import com.sharehouse.service.AdminService;

import lombok.extern.apachecommons.CommonsLog;

@Component
public class SessionListener implements HttpSessionListener {

	
	@Override
    public void sessionCreated(HttpSessionEvent arg0) {
 
        
        AdminService service = new AdminService();
         
        // 전체 방문자 수 +1
        service.setVisitTotalCount();
         
        // 오늘 방문자 수
        int todayCount = service.getVisitTodayCount();
         
        // 전체 방문자 수
        int totalCount = service.getVisitTotalCount();
         
        HttpSession session = arg0.getSession();
         
        // 세션 속성에 담아준다.
        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
         
    }
	
	  @Override
	    public void sessionDestroyed(HttpSessionEvent arg0) {
	 
	    }

}
