package com.guafindel.mm.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guafindel.mm.member.domain.ListViewData;
import com.guafindel.mm.member.domain.MemberInfo;
import com.guafindel.mm.member.domain.SearchParam;
import com.guafindel.mm.member.service.MemberListService;

@Controller
public class MemberListController {

	@Autowired
	private MemberListService listService;

	@RequestMapping(value = "member/memberlist")
	public String memberList(Model model, @RequestParam(value = "p", defaultValue = "1") int pageNumber,
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value = "keyword", required = false) String keyword) {

		SearchParam searchParam = null;

		if (stype != null && keyword != null && !stype.isEmpty() && !keyword.isEmpty()) {
			searchParam = new SearchParam();
			searchParam.setStype(stype);
			searchParam.setKeyword(keyword);
		}

		ListViewData listData = listService.getListData(pageNumber, searchParam);

		System.out.println("전체 회원의 수 : " + listData.getTotalCount());

		model.addAttribute("viewData", listData);

		return "member/memberList";
	}
	
	@RequestMapping(value = "member/memberlistJson1")
	@ResponseBody
	public String memberListJson1(
			@RequestParam(value = "p", defaultValue = "1") int pageNumber,
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value = "keyword", required = false) String keyword,
			Model model
			
			) {

		SearchParam searchParam = null;
		
		if(stype != null & keyword != null && !stype.isEmpty() && !keyword.isEmpty()) {
			searchParam = new SearchParam();
			searchParam.setStype(stype);
			searchParam.setKeyword(keyword);
		}
		
		ListViewData listData = listService.getListData(pageNumber, searchParam);
		
		model.addAttribute("viewData", listData);
		
		System.out.println("전체 회원의 수 : " + listData.getTotalCount());
		
		
		return "member/memberList2";
		
		
	}
	
	@RequestMapping(value = "member/memberlistJson2")
	@ResponseBody
	public ListViewData memberListJson2(
			@RequestParam(value = "p", defaultValue = "1") int pageNumber,
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value = "keyword", required = false) String keyword,
			HttpServletResponse response
			
			) {

		SearchParam searchParam = null;
		
		if(stype != null & keyword != null && !stype.isEmpty() && !keyword.isEmpty()) {
			searchParam = new SearchParam();
			searchParam.setStype(stype);
			searchParam.setKeyword(keyword);
		}
		
		ListViewData listData = listService.getListData(pageNumber, searchParam);
		
		response.setStatus(HttpServletResponse.SC_OK);
		//response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		//response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		
		System.out.println("전체 회원의 수 : " + listData.getTotalCount());
		
		
		return listData;
		
		
	}
	
	//반환 타입이 ResponseEntity<T> : Spring 4.2 이상일 때 사용 가능
	//반환 하는 Body, statusCode, HttpHeader
	@RequestMapping(value = "member/memberlistJson3")
	@ResponseBody
	public ResponseEntity<ListViewData> memberListJson3(
			@RequestParam(value = "p", defaultValue = "1") int pageNumber,
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value = "keyword", required = false) String keyword
			
			) {

		SearchParam searchParam = null;
		
		if(stype != null & keyword != null && !stype.isEmpty() && !keyword.isEmpty()) {
			searchParam = new SearchParam();
			searchParam.setStype(stype);
			searchParam.setKeyword(keyword);
		}
		
		ListViewData listData = listService.getListData(pageNumber, searchParam);
		
		//response.setStatus(HttpServletResponse.SC_OK);
		//response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		//response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		
		System.out.println("전체 회원의 수 : " + listData.getTotalCount());
		
		ResponseEntity<ListViewData> entity = 
				new ResponseEntity<ListViewData>(listData, HttpStatus.OK);
		
		return entity;
		
	}
}
