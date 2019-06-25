<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie c1 = CookieBox.createCookie("LOGIN", "", 0);
	response.addCookie(c1);
	
	Cookie c2 = CookieBox.createCookie("ID", "", 0);
	response.addCookie(c2);
%>
<!-- setMaxAge를 0은 쿠키 바로 삭제 -1은 브라우저 종료시 삭제-->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>로그아웃 되었습니다.</h1>
<a href="loginFrom.jsp">로그인</a>


</body>
</html>