package com.guafindel.mm.member.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.guafindel.mm.member.dao.MemberJdbcTemplateDao;
import com.guafindel.mm.member.dao.MemberSessionDao;
import com.guafindel.mm.member.domain.MemberInfo;

@Service(value = "loginService")
public class MemberLoginService implements MemberManagerService {

	// 인증 상태를 3개 상태로 구분해서 return, return type 변경
	// boolean -> int로 반환 타입 변경
	// 0-> 로그인 실패, 1-> 미인증 계정 로그인, 2-> 인증받은 정상 로그인

	@Autowired
	private SqlSessionTemplate template;

	private MemberSessionDao dao;

	public int login(String id, String pw, HttpServletRequest request) {

		dao = template.getMapper(MemberSessionDao.class);

		// boolean loginChk = false;

		int loginChk = 0;

		MemberInfo memberinfo = null;

		memberinfo = dao.selectMemberById(id);

		if (memberinfo != null && memberinfo.pwChk(pw)) {

			// verify 값 체크
			if (memberinfo.getVerify() == 'Y') {
				// 세션에 저장
				// loginChk 상대값을 변경
				request.getSession(true).setAttribute("logininfo", memberinfo.toLoginInfo());
				loginChk = 2;

			} else {
				// 미인증 로그인
				request.getSession(true).setAttribute("reEmail", memberinfo.getmId());
				loginChk = 1;
			}

		}

		return loginChk;
	}
}
