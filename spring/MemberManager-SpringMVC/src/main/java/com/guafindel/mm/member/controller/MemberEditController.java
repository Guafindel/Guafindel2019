package com.guafindel.mm.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.guafindel.mm.member.domain.MemberInfo;
import com.guafindel.mm.member.domain.RequestMemberEdit;
import com.guafindel.mm.member.service.MemberEditService;

@Controller
@RequestMapping(value = "member/memberEdit")
public class MemberEditController {
	
	@Autowired
	private MemberEditService editService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String editForm(@RequestParam("memberId") int id,
			Model model
			) {
		
		MemberInfo memberinfo = editService.getEditForm(id);
		
		model.addAttribute("editData", memberinfo);
		
		String view = "/member/editForm";
		
		return view;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String edit(RequestMemberEdit edit,
			HttpServletRequest request
			) {
		
		System.out.println("수정 ::::::" + edit);
		
		System.out.println("수정 이전 파일 : " + edit.getOldFile());
		
		int rCnt = 0;
		
		rCnt = editService.edit(edit, edit.getOldFile(), request);
		
		System.out.println(rCnt);
		
		String view = "redirect:/member/memberlist";
		
		return view;
	}
	
}
