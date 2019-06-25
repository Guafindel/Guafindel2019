<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	
	
	boolean chk = false;
	
	
	if(id.equals(pw)) {
		
			
		//쿠키 생성 : 사용자 데이터를 저장
		Cookie c1 = CookieBox.createCookie("LOGIN", "SUCCESS", -1);
		response.addCookie(c1);
		Cookie c2 = CookieBox.createCookie("ID", id, -1);
		response.addCookie(c2);
		//setMaxAge를 음수(-1)로 지정할 경우 브라우저를 종료했을 때 쿠키가 삭제할 것을 의미하는 코드.
		
		chk = true;
		
		
		}
	
	
	
%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>


	<%
		if(chk) {
			out.println("<h1>로그인 되었습니다.</h1>");
			out.println("<a href=\"loginCheck.jsp\">loginCheck</a>");
		} else {
			out.println("<script>alert(\'로그인에 실패\'); history.go(-1);</script>");
		}
	%>
	<a href="loginFrom.jsp">loginForm</a>
	         
</body>
</html>