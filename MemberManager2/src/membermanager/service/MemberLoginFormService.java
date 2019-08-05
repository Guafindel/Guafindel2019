package membermanager.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberLoginFormService implements MemberManagerService {



	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewName = "/WEB-INF/view//login/loginForm.jsp";
		
		return viewName ;
	}

}
