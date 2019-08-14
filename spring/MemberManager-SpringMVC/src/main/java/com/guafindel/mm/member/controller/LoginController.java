package com.guafindel.mm.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.guafindel.mm.member.service.MemberLoginService;

@Controller
@RequestMapping(value = "member/login")
public class LoginController {
	
	@Autowired
	private MemberLoginService loginService; 
	
	@RequestMapping(method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request) {
		
		String view = "member/loginForm";
		
		HttpSession session = request.getSession(false);
		
		if(session != null && session.getAttribute("logininfo") != null) {
			
			view = "redirect:/main";
		}
		
		return view;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String login(
			@RequestParam("mId") String id,
			@RequestParam("mPw") String pw,
			HttpServletRequest request,
			Model model
			) {
		
		String view = "member/loginfail";
		
		boolean loginChk = loginService.login(id, pw, request);
		
		if(loginChk) {
			
			view = "redirect:/main";
		}
		
		return view;
	}

}
