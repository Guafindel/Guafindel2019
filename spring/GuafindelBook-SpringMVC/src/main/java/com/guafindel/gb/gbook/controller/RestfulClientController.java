package com.guafindel.gb.gbook.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.guafindel.gb.gbook.domain.Gbook;
import com.guafindel.gb.gbook.domain.RequestGbookRegist;
import com.guafindel.gb.gbook.domain.RequestMemberEdit;
import com.guafindel.gb.gbook.service.GbookDeleteService;
import com.guafindel.gb.gbook.service.GbookEditService;
import com.guafindel.gb.gbook.service.GbookListService;
import com.guafindel.gb.gbook.service.GbookRegistService;

// /rest/members GET 리스트
// /rest/members/{id} POST 가입

@RestController
@RequestMapping("/rest/members")
public class RestfulClientController {

	@Autowired
	private GbookListService gbookListService;
	
	@Autowired
	private GbookRegistService gbookRegistService;
	
	@Autowired
	private GbookEditService gbookEditService;
	
	@Autowired
	private GbookDeleteService gbookDeleteService;

	@CrossOrigin
	@GetMapping
	public ResponseEntity<List<Gbook>> getAllList() {

		List<Gbook> list = gbookListService.getAllList();
		
		ResponseEntity<List<Gbook>> entity = new ResponseEntity<List<Gbook>>(list, HttpStatus.OK);
		
		return entity;
		
	}

	@PostMapping // 회원가입 정보를 입력받을 때 regist를 처리할 때 PostMapping를 처리한다.
	@CrossOrigin
	public ResponseEntity<String> regGbook(RequestGbookRegist regRequest, HttpServletRequest request) {

		System.out.println("RequestGbookRegist" + regRequest);

		return new ResponseEntity<String>(gbookRegistService.insert(request, regRequest) > 0 ? "success" : "fail",
				HttpStatus.OK);
	}

	@CrossOrigin
	@GetMapping("/{id}")
	public ResponseEntity<Gbook> editGbookForm(@PathVariable("id") int idx) {
		
		return new ResponseEntity<Gbook>(gbookEditService.editForm(idx), HttpStatus.OK);
	}
	
	@CrossOrigin
	@PutMapping("/{id}")
	public ResponseEntity<String> editGbook(@PathVariable("id") int idx,
			@RequestBody RequestMemberEdit editRequest,
			HttpServletRequest request
			) {
		
		editRequest.setIdx(idx);
		
		System.out.println("check : " + editRequest);
		
		return new ResponseEntity<String>(gbookEditService.edit(editRequest, null, request) >0 ? "success" : "fail", HttpStatus.OK);
	}
	
	@CrossOrigin
	@DeleteMapping("/{id}")
	public ResponseEntity<String> deleteGbook(@PathVariable("id") int idx) {
		
		return new ResponseEntity<String>(gbookDeleteService.delete(idx)>0 ? "success" : "fail" , HttpStatus.OK);
	}
}
