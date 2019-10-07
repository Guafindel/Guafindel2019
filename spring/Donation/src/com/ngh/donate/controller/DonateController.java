package com.ngh.donate.controller;

import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ngh.donate.domain.DonateInfo;
import com.ngh.donate.domain.DonateListInfo;
import com.ngh.donate.domain.DonateListInfoTotal;
import com.ngh.donate.domain.DonationEditInfo;
import com.ngh.donate.domain.SearchParam;
import com.ngh.donate.service.DeleteService;
import com.ngh.donate.service.DonateListService;
import com.ngh.donate.service.DonateService;
import com.ngh.donate.service.EditService;

@RestController
@RequestMapping("/donate")
public class DonateController {
	
	@Autowired
	private DonateService donateService;
	
	@Autowired
	private DonateListService donateListService;
	
	@Autowired
	private DeleteService deleteService;

	@Autowired
	private EditService editService;
	
	@CrossOrigin
	@GetMapping
	public ResponseEntity<DonateListInfoTotal> getList(
			@RequestParam(value = "d_id") String uid,
			@RequestParam(value = "p", defaultValue = "1") int pageNumber,
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value = "keyword", required = false) String keyword
			){
		
		SearchParam sp = null;
		String accountNumber = "";
		String day = "";
		
		if(stype!=null && !stype.isEmpty() && stype.equals("day")) {
			day = keyword;
			sp = new SearchParam(accountNumber, day);
		}
		if(stype!=null && !stype.isEmpty() && stype.equals("account")) {
			accountNumber = keyword;
			sp = new SearchParam(accountNumber, day);
		}
		
		
		List<DonateListInfo> list = donateListService.getList(uid,pageNumber,sp);
		
		DonateListInfoTotal listInfo = new DonateListInfoTotal(list, donateListService.getCount(uid,pageNumber,sp));
		
		ResponseEntity<DonateListInfoTotal> entity = new ResponseEntity<DonateListInfoTotal>(listInfo, HttpStatus.OK);
		
		return entity;
	}
	
	@CrossOrigin
	@PostMapping
	public ResponseEntity<String> donate(
			DonateInfo donateInfo,
			HttpServletRequest request){
		
		System.out.println("check : "+ donateInfo);
		
		int cnt = donateService.donateInfoInsert(request, donateInfo);
		
		return new ResponseEntity<String>(cnt>0?"SUCCESS":"FAIL", HttpStatus.OK);
				
				
		
	}
	
	@CrossOrigin
	@DeleteMapping("/{index}") //  
	public ResponseEntity<String> deleteMember(
			@PathVariable("index") int index
			) {
		return new ResponseEntity<String>(
				deleteService.delete(index)>0?"SUCCESS":"FAIL",
				HttpStatus.OK
				);
	}
	
	
	@CrossOrigin
	@PutMapping
	public @ResponseBody ResponseEntity<String> editMember(
			@RequestBody  DonationEditInfo donateEditInfo
			){
		
		int cnt = editService.edit(donateEditInfo);
		System.out.println(cnt+"---------------");
		System.out.println(donateEditInfo.getD_index());
		return new ResponseEntity<String>(cnt>0?"SUCCESS":"FAIL", HttpStatus.OK);
	}

}
