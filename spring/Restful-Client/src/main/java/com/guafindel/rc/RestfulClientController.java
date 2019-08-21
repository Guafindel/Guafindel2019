package com.guafindel.rc;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
public class RestfulClientController {

	@RequestMapping("/list")
	@ResponseBody
	public String getAllList() {
		
		RestTemplate restTemplate = new RestTemplate();
		
		MemberInfo[] members = restTemplate.getForObject(
				"http://localhost:8080/mm/rest/members",
				MemberInfo[].class);
		
		List<MemberInfo> list = Arrays.asList(members);
		
		for(MemberInfo m : list) {
			System.out.println(m);
		}
		
		return "view/list";
	}
	
	@RequestMapping(value = "/member/{idx}")
	@ResponseBody
	public String getMember(
			@PathVariable("idx") int idx
			) {
		
		RestTemplate restTemplate = new RestTemplate();
		
		MemberInfo memberInfo = restTemplate.getForObject(
				"http://localhost:8080/mm/rest/members/{id}",
				MemberInfo.class,
				idx);
		
		System.out.println(memberInfo);
		
		return null;
	}
}
