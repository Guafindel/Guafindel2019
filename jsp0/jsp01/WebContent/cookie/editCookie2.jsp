<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키의 이름이 name인 쿠키 데이터를 변경하고자 한다.
	//기존 이름의 쿠키 객체를 생성 : 새로운 데이터로 등록
	//Cookie c = new Cookie("name","최아린");
	Cookie c = CookieBox.createCookie("name", "최아린");
	response.addCookie(c);
	
	//Cookie c1 = new Cookie("code","foorboy");
	Cookie c1 = CookieBox.createCookie("code","foorboy");
	response.addCookie(c1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery CDN 1.12.4 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 스타일 시작 -->
<style>

</style>
<!-- 스타일 끝 -->

</head>
<body>
	<h1>쿠키 정보가 변경되었습니다.</h1>
	<a href="viewCookie2.jsp">viewCookie</a>
</body>
</html>