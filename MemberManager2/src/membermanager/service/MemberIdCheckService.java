package membermanager.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membermanager.dao.MemberInfoDao;
import membermanager.model.MemberInfo;

public class MemberIdCheckService implements MemberManagerService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		Connection conn = null;
		MemberInfoDao dao = MemberInfoDao.getInstance();
		
		MemberInfo memberinfo = null;
		
		String resultCode = "N";
		
		try {
			conn = jdbc.ConnectionProvider.getConnection();
			
			memberinfo = dao.select(conn, id);
			
			if(memberinfo == null) {
				
				resultCode = "Y";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("resultCode", resultCode);
		
		
		return "/WEB-INF/view/member/idcheck.jsp";
	}

}
