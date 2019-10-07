package com.guafindel.event.controller;


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
import org.springframework.web.bind.annotation.RestController;

import com.guafindel.event.domain.EventInfo;
import com.guafindel.event.domain.ListViewData;
import com.guafindel.event.domain.RequestEventEdit;
import com.guafindel.event.domain.SearchParam;
import com.guafindel.event.service.DeleteEventService;
import com.guafindel.event.service.EditEventService;
import com.guafindel.event.service.ListEventService;
import com.guafindel.event.service.WriteEventService;

@RestController
@RequestMapping("/events/board")
public class RestfulController {

	// 기억해두자 HttpStatus의 숫자가 의미하는 오류들
	// HttpStatus.OK -> 200
	// HttpStatus.NOT_FOUND -> 404
	// HttpStatus.INTERNAL_SERVER_ERROR -> 500

	@Autowired
	private ListEventService listService;

	@Autowired
	private WriteEventService writeService;

	@Autowired
	private EditEventService editService;

	@Autowired
	private DeleteEventService deleteService;

	@CrossOrigin
	@GetMapping("/list")
	public ResponseEntity<List<EventInfo>> getAllList() {

		List<EventInfo> list = listService.getAllList();

		ResponseEntity<List<EventInfo>> entity = new ResponseEntity<List<EventInfo>>(list, HttpStatus.OK);

		return entity;

	}

	/*
	 * @CrossOrigin
	 * @GetMapping("/{e_id}") 
	 * public ResponseEntity<EventInfo>
	 * getEventList(@PathVariable("e_id") String e_id) {
	 * 
	 * EventInfo list = listService.selectById(e_id);
	 * 
	 * ResponseEntity<EventInfo> entity = new ResponseEntity<EventInfo>(list,
	 * HttpStatus.OK);
	 * 
	 * return entity; }
	 */

	@CrossOrigin
	@GetMapping
	public ResponseEntity<ListViewData> eventList(
			@RequestParam(value = "p", defaultValue = "1") int pageNumber,
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value = "keyword", required = false) String keyword) {

		SearchParam searchParam = null;

		if (stype != null && keyword != null && !stype.isEmpty() && !keyword.isEmpty()) {

			searchParam = new SearchParam();
			searchParam.setStype(stype);
			searchParam.setKeyword(keyword);
		}

		ListViewData listData = listService.getListData(pageNumber, searchParam);

		return new ResponseEntity<ListViewData>(listData, HttpStatus.OK);

	}

	@CrossOrigin
	@PostMapping
	public ResponseEntity<String> writeEvent(EventInfo eventInfo, HttpServletRequest request) {

		// System.out.println("check : " + eventInfo);

		return new ResponseEntity<String>(writeService.insertEvent(request, eventInfo) > 0 ? "success" : "fail",
				HttpStatus.OK);
	}

	@CrossOrigin
	@GetMapping("/{e_num}")
	public ResponseEntity<EventInfo> updateForm(@PathVariable("e_num") int e_num) {

		EventInfo eventInfo = editService.getUpdateForm(e_num);

		// System.out.println(eventInfo);

		return new ResponseEntity<EventInfo>(eventInfo, HttpStatus.OK);

	}

	@CrossOrigin
	@PutMapping("/{e_num}")
	public ResponseEntity<String> updateEvent(@PathVariable("e_num") int e_num,
			@RequestBody RequestEventEdit editRequest, HttpServletRequest request) {

		// System.out.println("check : " + editRequest);

		return new ResponseEntity<String>(editService.updateEvent(editRequest, request) > 0 ? "success" : "fail",
				HttpStatus.OK);

	}

	@CrossOrigin
	@DeleteMapping("/{e_num}")
	public ResponseEntity<String> deleteEvent(@PathVariable("e_num") int e_num) {

		return new ResponseEntity<String>(deleteService.deleteEvent(e_num) > 0 ? "success" : "fail", HttpStatus.OK);

	}

}
