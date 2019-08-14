package com.guafindel.mm.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberLogoutController {

	@RequestMapping(value = "/member/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		
		return "redirect:/main";
	}
}
