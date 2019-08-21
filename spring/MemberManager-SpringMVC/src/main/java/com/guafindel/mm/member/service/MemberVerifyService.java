package com.guafindel.mm.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guafindel.mm.member.dao.MemberSessionDao;
import com.guafindel.mm.member.domain.MemberInfo;

@Service("verifyService")
public class MemberVerifyService {

	@Autowired
	private SqlSessionTemplate template;

	private MemberSessionDao dao;
	
	@Autowired
	private MailSenderService mailService;
	
	public String verify(String id, String code) {
		
		dao = template.getMapper(MemberSessionDao.class);
		
		int rCnt = dao.verify(id, code);
		
		return rCnt>0?"success":"fail";
	}
	
	
	public int reMailSend(String email) {
		
		dao = template.getMapper(MemberSessionDao.class);
		
		System.out.println("email : " + email);
		
		MemberInfo memberinfo = dao.selectMemberById(email);
		
		System.out.println("check : " + memberinfo);
		
		mailService.reSend(memberinfo.getmId(), memberinfo.getCode());
		
		return 1;
	}
}
