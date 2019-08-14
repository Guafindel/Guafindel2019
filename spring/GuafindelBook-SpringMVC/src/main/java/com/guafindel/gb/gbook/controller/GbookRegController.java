package com.guafindel.gb.gbook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.guafindel.gb.gbook.domain.RequestGbookRegist;
import com.guafindel.gb.gbook.service.GbookRegistService;

@Controller
@RequestMapping("/gbook/regist")
public class GbookRegController {
	
	@Autowired
	private GbookRegistService registService;

	@RequestMapping(method = RequestMethod.GET)
	public String gbookRegForm() {
		
		return "gbook/registForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String gbookReg(
			RequestGbookRegist regist,
			HttpServletRequest request,
			Model model
			) {
		
		System.out.println(regist);
		
		model.addAttribute("rCnt", registService.insert(request, regist));
		
		return "gbook/regist";
	}
}
