package com.guafindel.mm.member.controller;

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

import com.guafindel.mm.member.domain.MemberInfo;
import com.guafindel.mm.member.domain.RequestMemberEdit;
import com.guafindel.mm.member.domain.RequestMemberRegist;
import com.guafindel.mm.member.service.MemberDeleteService;
import com.guafindel.mm.member.service.MemberEditService;
import com.guafindel.mm.member.service.MemberListService;
import com.guafindel.mm.member.service.MemberRegService;

@RestController // @RestController 사용시 @ResponseBody 생략 가능.
@RequestMapping(value = "/rest/members")
public class MemberRestFulController {

	@Autowired
	private MemberListService listService;

	@Autowired
	private MemberDeleteService deleteService;

	@Autowired
	private MemberRegService regService;

	@Autowired
	private MemberEditService editService;

	@CrossOrigin
	@GetMapping // @GetMapping은 @RequestMapping(method = RequestMethod.GET)과 같다.
	public ResponseEntity<List<MemberInfo>> getAllList() {

		List<MemberInfo> list = listService.getAllList();

		ResponseEntity<List<MemberInfo>> entity = new ResponseEntity<List<MemberInfo>>(list, HttpStatus.OK);

		// HttpStatus.OK -> 200
		// HttpStatus.NOT_FOUND -> 404
		// HttpStatus.INTERNAL_SERVER_ERROR -> 500

		return entity;
	}

	@CrossOrigin
	@DeleteMapping("/{id}") // 찾아가게 되는 주소 /rest/members/12
	public ResponseEntity<String> deleteMember(@PathVariable("id") int idx) {

		// int cnt = deleteService.memberDelete(idx);

		return new ResponseEntity<String>(deleteService.memberDelete(idx) > 0 ? "success" : "fail", HttpStatus.OK); // 삼항연산자
																													// 0보다
																													// 크면
																													// success(true)
																													// 0보다
																													// 작으면
																													// fail(false)
	}

	@CrossOrigin
	@PostMapping // @RequestMapping(method = HttpMethod.POST)와 같다.
	public ResponseEntity<String> regMember(
			RequestMemberRegist regRequest,
			HttpServletRequest request
			) {

		System.out.println("check : " + regRequest);

		return new ResponseEntity<String>(
				regService.memberInsert(request,
						regRequest) > 0 ? "success" : "fail",
								HttpStatus.OK);

	}

	@GetMapping("/{id}")
	@CrossOrigin
	public ResponseEntity<MemberInfo> editForm(@PathVariable("id") int idx) {

		return new ResponseEntity<MemberInfo>(editService.getEditForm(idx), HttpStatus.OK);

	}

	@CrossOrigin
	@PutMapping("/{id}") // @RequestMapping(method = HttpMethod.PUT)과 같다. public
	ResponseEntity<String> editMember(
			@PathVariable("id") int idx,
			@RequestBody RequestMemberEdit editRequest,
			HttpServletRequest request
			) {
		
		editRequest.setIdx(idx);
		

		System.out.println("check : " + editRequest);

		return new ResponseEntity<String>(editService.edit(editRequest, null, request) > 0 ? "success" : "fail",
				HttpStatus.OK);
	}

}
