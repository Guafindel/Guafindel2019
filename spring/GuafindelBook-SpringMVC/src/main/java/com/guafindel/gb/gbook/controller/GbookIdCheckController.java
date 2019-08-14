package com.guafindel.gb.gbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guafindel.gb.gbook.service.GbookRegistService;

@Controller
public class GbookIdCheckController {
	
	@Autowired
	private GbookRegistService regService;

	@RequestMapping("/gbook/idCheck")
	public String idCheck(
			@RequestParam("gId") String gId,
			Model model
			) {
		
		model.addAttribute("result", regService.idCheck(gId));
		
		return "gbook/idCheck";
		
	}
}
