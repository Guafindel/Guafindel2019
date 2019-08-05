package com.guafindel.mvc;

import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	
	@RequestMapping(value = "/hello")
	public ModelAndView hello() {
		
		//FrontController 전송할 View 경로와 결과 데이터 저장하고 전달할 객체 -> ModelAndView
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("hello"); // /WEB-INF/views/hello.jsp
		modelAndView.addObject("userName", "Cool");
		modelAndView.addObject("guafindel","안녕하세요");
		modelAndView.addObject("now", new Date());
		modelAndView.addObject("greeting", getGreeting());
		
		return modelAndView;
		
	}
	
	private String getGreeting() {
		
		int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
		
		if(hour >= 24 && hour <= 6) {
			return "새벽이네요.";
		} else if(hour > 6 && hour <= 12) {
			return "아침은 어떠신가요?";
		} else if(hour > 12 && hour <= 18) {
			return "오후는 어떻게 보내셨나요?";
		} else if (hour > 18 && hour < 24)
			return "오늘 하루를 마무리 하실 시간이네요.";
		return "안녕하세요";
	}
	
	
	
	
	

}
