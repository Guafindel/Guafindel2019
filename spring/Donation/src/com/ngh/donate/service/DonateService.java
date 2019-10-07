package com.ngh.donate.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.ngh.donate.dao.DonateDaoInterface;
import com.ngh.donate.domain.DonateInfo;

@Service("donateService")
public class DonateService implements DonationService {
	
	private DonateDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	public int donateInfoInsert(
			HttpServletRequest request,
			DonateInfo donateInfo
			){
		
		dao = template.getMapper(DonateDaoInterface.class);
		
		int resultCnt = dao.insert(donateInfo);
		
		return resultCnt;
	}
	
}
