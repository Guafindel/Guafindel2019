package com.guafindel.event.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.event.dao.EventSessionDao;
import com.guafindel.event.domain.EventInfo;
import com.guafindel.event.domain.RequestEventEdit;

@Service("editService")
public class EditEventService implements EventManagerService {

	@Autowired
	private SqlSessionTemplate template;
	
	private EventSessionDao dao;
	
	public EventInfo getUpdateForm(int e_num) {
		
		dao = template.getMapper(EventSessionDao.class);
		
		EventInfo eventInfo = dao.selectByNum(e_num);
		
		return eventInfo;
	}
	
	public int updateEvent(RequestEventEdit edit, HttpServletRequest request) {
		
		dao = template.getMapper(EventSessionDao.class);
		
		int rCnt = 0;
		
		EventInfo eventInfo = edit.toEventInfo();
		
		rCnt = dao.eventUpdate(eventInfo);
		
		System.out.println(eventInfo);
		System.out.println(rCnt);
		
		return rCnt;
	}
	
}
