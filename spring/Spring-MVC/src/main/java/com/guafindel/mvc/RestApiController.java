package com.guafindel.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.guafindel.mvc.domain.Login;

@RestController
public class RestApiController {

	//@PostMapping
	//@PutMapping
	//@DeleteMapping 
	//@GetMapping(value = "/restapi/hello") GetMapping은 메소드 방식이 GET형식으로 정해진 방식이다.
	@RequestMapping(value = "/restapi/hello", name = "/restapi", method = RequestMethod.GET)
	public String hello() {
		
		return "hello";
	}
	
	@RequestMapping("restapi/login")
	public Login login() {
		
		Login login = new Login();
		
		login.setuId("Arin");
		login.setuPw("1234");
		
		return login;
	}
	
	@RequestMapping("restapi/loginList")
	public List<Login> loginList() {
		
		List<Login> list = new ArrayList<Login>();
		
		Login login = new Login();
		login.setuId("Arin");
		login.setuPw("1234");
		
		list.add(login);
		
		login = new Login();
		login.setuId("Johsua");
		login.setuPw("7934");
		
		list.add(login);
		
		return list;
	}
	
	@RequestMapping("restapi/loginMap")
	public Map<String, Login> loginMap() {
		
		Map<String, Login> maps = new HashMap<String, Login>();
	
		Login login = new Login();
		login.setuId("Arin");
		login.setuPw("1234");
		
		maps.put("1", login);
		
		login = new Login();
		login.setuId("Johsua");
		login.setuPw("7934");
		
		maps.put("2", login);
		
		return maps;
	}
	
	
}
