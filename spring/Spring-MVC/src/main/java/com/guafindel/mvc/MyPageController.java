package com.guafindel.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	
	@RequestMapping("/myPage")
	public ModelAndView myPage() {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("myPage");
		modelAndView.addObject("myPage1", "부트스트랩의 container 클래스 명령어는");
		modelAndView.addObject("myPage2", "페이지의 width(가로폭)을 100퍼센트 이용하지 않고");
		modelAndView.addObject("myPage3", "좌측과 우측부분을 제외한 가운데 부분만을 이용합니다.");
		modelAndView.addObject("myPage4", "이렇게 말이죠.");
		modelAndView.addObject("myPage5", "이것은 row와 col-sm-4 클래스를 이용한 반응형 페이지를 구성하는 클래스 입니다.");
		modelAndView.addObject("myPage6", "페이지 화면의 크기를 줄였다 늘였다 확인해보세요.");
		modelAndView.addObject("myPage7", "이 부분은 줄어든 페이지의 크기와 함께 줄어들고 늘어납니다..");
		
		return modelAndView;
	}
	
}
