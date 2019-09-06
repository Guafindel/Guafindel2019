package com.guafindel.event.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.event.dao.EventSessionDao;
import com.guafindel.event.domain.EventInfo;

@Service("writeService")
public class WriteEventService implements EventManagerService {

	@Autowired
	private SqlSessionTemplate template;
	
	private EventSessionDao dao;
	
	public int insertEvent(HttpServletRequest request, EventInfo eventInfo) {
		
		dao = template.getMapper(EventSessionDao.class);
		
		int rCnt = 0;
		
		rCnt = dao.eventInsert(eventInfo);
		
		System.out.println(rCnt);
		
		return rCnt;
	}
}
