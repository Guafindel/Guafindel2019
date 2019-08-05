package membermanager.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import membermanager.dao.MemberInfoDao;
import membermanager.model.LoginInfo;
import membermanager.model.MemberInfo;

public class MemberLoginService implements MemberManagerService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		
		MemberInfoDao dao = MemberInfoDao.getInstance();
		
		Connection conn = null;
		
		MemberInfo memberinfo = null;
		
		String msg = "로그인 성공했습니다.";
		
		boolean loginChk = false;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			memberinfo = dao.select(conn, mId);
			
			System.out.println("로그인 체크 정보 : " + memberinfo);
			
			if(memberinfo != null && memberinfo.pwChk(mPw)) {
				//세션 추가
				LoginInfo logininfo = memberinfo.toLoginInfo();
				
				//회원 개인정보를 세션영역 속성에 저장
				request.getSession(false).setAttribute("logininfo", logininfo);
				
				loginChk = true;
			
			} else {
				throw new LoginFailException("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = e.getMessage();
			
		} catch (LoginFailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = e.getMessage();
		}
		
		//결과 메세지 request 속성에 저장
		request.setAttribute("msg", msg);
		request.setAttribute("loginChk", loginChk);
		
		String viewName = "/WEB-INF/view/login/login.jsp";
		
		return viewName;
	}

}
