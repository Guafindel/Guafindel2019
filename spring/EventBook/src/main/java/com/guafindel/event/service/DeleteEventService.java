package com.guafindel.event.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.event.dao.EventSessionDao;

@Service("deleteService")
public class DeleteEventService implements EventManagerService {

	@Autowired
	private SqlSessionTemplate template;
	
	private EventSessionDao dao;
	
	public int deleteEvent(int e_num) {
		
		dao = template.getMapper(EventSessionDao.class);
		
		return dao.eventDelete(e_num);
	}
}
