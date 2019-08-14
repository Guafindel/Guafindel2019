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

	//@Autowired
	//private MemberInfoDao dao;

	//@Autowired
	//private MemberJdbcTemplateDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberSessionDao dao;

	public boolean login(String id, String pw, HttpServletRequest request) {
		
		dao = template.getMapper(MemberSessionDao.class);

		boolean loginChk = false;

		MemberInfo memberinfo = null;

		// Connection conn = null;

		// try {
		// conn = ConnectionProvider.getConnection();

		// memberinfo = dao.select(conn, id);
		memberinfo = dao.select(id);

		if (memberinfo != null && memberinfo.pwChk(pw)) {
			// 세션에 저장
			// loginChk 상대값을 변경
			request.getSession(true).setAttribute("logininfo", memberinfo.toLoginInfo());
			loginChk = true;
		}
		// } catch (SQLException e) {
		// TODO Auto-generated catch block
		// e.printStackTrace();
		// }

		return loginChk;
	}
}
