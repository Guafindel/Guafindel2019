package com.guafindel.gb;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {

	@RequestMapping("/main")
	public String getMain(HttpSession session) {
		
		return "main";
	}
}
