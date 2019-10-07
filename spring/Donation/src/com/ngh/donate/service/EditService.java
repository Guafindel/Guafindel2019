package com.ngh.donate.service;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.ngh.donate.dao.DonateDaoInterface;
import com.ngh.donate.domain.DonationEditInfo;

@Service("editService")
public class EditService implements DonationService{

	private DonateDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	public int edit(DonationEditInfo donateEditInfo) {
		
		dao = template.getMapper(DonateDaoInterface.class);
		
		int cnt = dao.edit(donateEditInfo);
		
		return cnt;
	}
}
