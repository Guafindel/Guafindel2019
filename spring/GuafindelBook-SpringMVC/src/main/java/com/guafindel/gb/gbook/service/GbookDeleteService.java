package com.guafindel.gb.gbook.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.gb.gbook.dao.GbookSessionDao;

@Service("gbookDeleteService")
public class GbookDeleteService implements GbookService {

	@Autowired
	private SqlSessionTemplate template;

	private GbookSessionDao dao;

	public int delete(int id) {

		dao = template.getMapper(GbookSessionDao.class);

		return dao.delete(id);

	}

}
