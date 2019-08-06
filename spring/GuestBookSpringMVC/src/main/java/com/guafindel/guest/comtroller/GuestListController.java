package com.guafindel.guest.comtroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guafindel.guest.domain.MessageListView;
import com.guafindel.guest.service.GetMessageListService;

@Controller
public class GuestListController {
	
	@Autowired
	private GetMessageListService listService;

	@RequestMapping(value = "/guest/list")
	public String getList(@RequestParam(
			value = "page", defaultValue = "1") int pageNumber,
			Model model) {
		
		MessageListView listView = listService.getMessageListView(pageNumber);
		
		model.addAttribute("viewData", listView);
		
		
		return "guest/list";
	}
}
