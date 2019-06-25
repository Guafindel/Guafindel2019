<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String saveid = "";
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i< cookies.length; i++){
			if(cookies[i].getName().equals("id")){
				saveid=cookies[i].getValue();				
			}
		}
	}
	%>
	
	
	<h1>로그인</h1>
	<hr>
	<form action="login.jsp" method="post">
		아이디 <input type="text" name="id"> <br>
		비밀번호 <input type="password" name="pw"> <br>
		아이디 저장해서 사용 <input type="checkbox" name="saveid"> <br>
		<input type="submit" value="로그인"> <br>
	</form>
	
	<br>
	<a href="loginCheck.jsp">loginCheck</a>
	

</body>
</html>