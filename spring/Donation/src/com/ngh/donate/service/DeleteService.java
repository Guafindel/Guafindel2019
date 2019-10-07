package com.ngh.donate.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.ngh.donate.dao.DonateDaoInterface;

@Service("deleteService")
public class DeleteService implements DonationService{

	private DonateDaoInterface dao;
		
	@Inject
	private SqlSessionTemplate template;
		
	public int delete(int index) {
		
		dao = template.getMapper(DonateDaoInterface.class);
		
		int cnt = dao.delete(index);
		
		return cnt;
	}
	
	

}
