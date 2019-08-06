package com.guafindel.mm.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberMyPageService implements MemberManagerService{

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "/WEB-INF/view/member/mypage.jsp";
	}

}
