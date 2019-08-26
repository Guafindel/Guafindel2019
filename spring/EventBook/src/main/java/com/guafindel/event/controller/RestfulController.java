package com.guafindel.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.guafindel.event.domain.EventInfo;
import com.guafindel.event.service.WriteEventService;

@RestController
@RequestMapping("/events/board")
public class RestfulController {

	@Autowired
	private WriteEventService writeService;

	public ResponseEntity<List<EventInfo>> getAllList() {

		/*
		 * List<EventInfo> list = listService.getAllList();
		 * 
		 * ResponseEntity<List<EventInfo>> entity = new
		 * ResponseEntity<List<EventInfo>>(list, HttpStatus.OK);
		 * 
		 * //기억해두자 HttpStatus의 숫자가 의미하는 오류들 // HttpStatus.OK -> 200 //
		 * HttpStatus.NOT_FOUND -> 404 // HttpStatus.INTERNAL_SERVER_ERROR -> 500
		 * 
		 * return entity;
		 */

		return null;
	}

	@CrossOrigin
	@PostMapping
	public ResponseEntity<String> writeEvent(EventInfo eventInfo, HttpServletRequest request) {

		System.out.println("check : " + eventInfo);

		return new ResponseEntity<String>(writeService.eventInsert(request, eventInfo) > 0 ? "success" : "fail",
				HttpStatus.OK);
	}

}
