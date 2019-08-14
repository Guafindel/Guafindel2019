package com.guafindel.mm.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@RequestMapping(value = "/member/mypage")
	public String myPage(HttpSession session) {
		
		String view = "member/mypage";
		
		if(session == null || session.getAttribute("logininfo") == null) {
			
			view = "redirect:/member/login";
		}
		
		return view;
	}
}
