package com.guafindel.mm;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guafindel.mm.member.domain.LoginInfo;

@Controller
public class MainController {
	
	@RequestMapping(value = "/main")
	public String MainPage(HttpSession session) {
		
		if(session != null) {
			System.out.println(session.getAttribute("logininfo"));
		}
		
		return "main";
	}

}
