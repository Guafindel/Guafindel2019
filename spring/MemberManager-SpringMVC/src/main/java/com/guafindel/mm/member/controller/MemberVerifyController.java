package com.guafindel.mm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guafindel.mm.member.service.MemberVerifyService;

@Controller
public class MemberVerifyController {
	
	@Autowired
	private MemberVerifyService verifyService;

	//@ResponseBody
	@RequestMapping("/member/verify")
	public String verify(
			@RequestParam("id") String id,
			@RequestParam("code") String code
			) {
		
		String verifyResult = verifyService.verify(id, code);
		
		return "member/verify"+verifyResult;  // /WEB-INF/views/member/verifySuccess.jsp
	}
	
	//메일 재 발송 요청
	@ResponseBody
	@RequestMapping("/member/verify/reMailSend")
	public String reMailSend(
			@RequestParam("email") String email
			) {
		
		int rCnt = verifyService.reMailSend(email);
		
		return rCnt>0?"success":"fail"; //ajax로 처리하기 위함
	}
}
