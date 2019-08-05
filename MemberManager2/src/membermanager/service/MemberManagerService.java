package membermanager.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MemberManagerService {
	
	String getViewName(HttpServletRequest request, HttpServletResponse response);

}
