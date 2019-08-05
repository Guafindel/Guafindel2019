package com.guafindel.mvc.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HeaderController {

	@RequestMapping("/header/getHeader")
	public String getHeader(@RequestHeader(value = "referer") String referer, Model model) {
		
		System.out.println(referer);
		
		model.addAttribute("result", referer);
		
		return "header/header";
	}
}
