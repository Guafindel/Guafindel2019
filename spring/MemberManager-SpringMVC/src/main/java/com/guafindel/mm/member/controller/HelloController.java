package com.guafindel.mm.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guafindel.mm.member.domain.MemberInfo;

@Controller
public class HelloController {

	@RequestMapping(value = "/hello")
	public String page() {
		
		MemberInfo memberInfo = null;
		
		System.out.println(memberInfo.getIdx());
		
		return "main";
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String handlerNullPointerException(NullPointerException exception) {
		
		return "error/NullPointerException";
	}
}
