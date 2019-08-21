package com.guafindel.gb.gbook.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.gb.gbook.dao.GbookSessionDao;
import com.guafindel.gb.gbook.domain.Gbook;

@Service("gbookListService")
public class GbookListService implements GbookService {

	@Autowired
	private SqlSessionTemplate template;

	private GbookSessionDao dao;
	
	public List<Gbook> getAllList() {
		
		dao = template.getMapper(GbookSessionDao.class);
		
		List<Gbook> list = dao.selectAllList();
		
		return list;
	}
}
