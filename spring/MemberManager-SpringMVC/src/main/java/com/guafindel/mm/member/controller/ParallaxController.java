package com.guafindel.mm.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ParallaxController {

	@RequestMapping("parallax/main")
	public String getMain() {
		
		return "parallax/main";
	}
}
