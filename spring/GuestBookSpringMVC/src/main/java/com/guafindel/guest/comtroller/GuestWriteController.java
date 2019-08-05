package com.guafindel.guest.comtroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.guafindel.guest.domain.Message;
import com.guafindel.guest.domain.RequestGuestWrite;
import com.guafindel.guest.service.WriteMessageService;

@Controller
public class GuestWriteController {
	
	@Autowired
	private WriteMessageService writeService;
	
	@RequestMapping(value = "/guest/writeForm")
	public String getWriteForm() {
		
		return "guest/writeForm";
	}
	
	@RequestMapping(value = "/guest/write", method = RequestMethod.POST)
	public String write(RequestGuestWrite requestGuestWrite, Model model) {
		
		System.out.println(requestGuestWrite);
		
		int rCnt = writeService.write(requestGuestWrite.toMessage());
		
		model.addAttribute("resultCnt", rCnt);
		
		return "guest/write";
	}
}
