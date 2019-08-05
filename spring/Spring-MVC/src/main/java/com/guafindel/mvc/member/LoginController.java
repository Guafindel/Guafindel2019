package com.guafindel.mvc.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.guafindel.mvc.domain.Login;

@Controller
public class LoginController {

	// 로그인 폼 페이지 요청
	@RequestMapping(value = "/member/loginForm")
	public String getLoginForm() {

		// View Path : Resolver의 범위에 포함된 경로
		return "member/loginForm";
	}

	@RequestMapping(value = "/member/loginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request) {

		String id = request.getParameter("uId");
		String pw = request.getParameter("uPw");

		System.out.println(id + " : " + pw);

		ModelAndView modelAndView = new ModelAndView();

		// View Name 설정
		modelAndView.setViewName("member/loginProcess");
		modelAndView.addObject("id", id);
		modelAndView.addObject("pw", pw);

		return modelAndView;
	}

	@RequestMapping("/member/loginProc")
	public String loginProc(
			@RequestParam(value = "uId", defaultValue = "cool") String id,
			@RequestParam(value = "uPw", required = true) String pw,
			Model model
			) {

		System.out.println(id + " : " + pw);

		model.addAttribute("id", id);
		model.addAttribute("pw", pw);

		return "member/loginProcess";

	}
	//@ModelAttribute("user") - user.uId로 받게 만드는 어노테이션 만약 이게 없다면 login 자바빈의 get메소드로 받아온다.
	@RequestMapping("/member/loginOk")
	public String loginOk(@ModelAttribute("user")Login login) {

		System.out.println(login.getuId() + " : " + login.getuPw());

		login.setuId(login.getuId()+"-12345");
		
		return "member/loginProcess";

	}

}
