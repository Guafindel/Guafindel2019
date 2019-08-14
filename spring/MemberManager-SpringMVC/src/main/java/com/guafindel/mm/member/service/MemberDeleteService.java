package com.guafindel.mm.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.guafindel.mm.member.dao.MemberJdbcTemplateDao;
import com.guafindel.mm.member.dao.MemberSessionDao;

@Service("deleteService")
public class MemberDeleteService implements MemberManagerService {

	//@Autowired
	//private MemberJdbcTemplateDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberSessionDao dao;

	public int memberDelete(int id) {

		dao = template.getMapper(MemberSessionDao.class);
		
		return dao.memberDelete(id);
	}
}
