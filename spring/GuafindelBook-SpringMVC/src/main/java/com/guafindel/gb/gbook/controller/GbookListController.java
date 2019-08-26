package com.guafindel.gb.gbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guafindel.gb.gbook.service.GbookListService;

@Controller
public class GbookListController {

	@Autowired
	private GbookListService gbookListService;

	@RequestMapping("gbook/memberList")
	public String GbookList() {
		
		return "gbook/gbookList";
	}
	
}
