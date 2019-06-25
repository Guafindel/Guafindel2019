<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 쿠키 등록 방법(쿠키를 굽는다.)
		1. Cookie 객체를 생성 : new Cookie(쿠키이름, 데이터)
		2. response 객체에 Cookie를 추가 : response.addCookies(쿠키객체의 참조변수)
		
		Cookie 객체 생성 
	*/
	Cookie cookie = new Cookie("code","ace");
		
	//response에 쿠키 객체 추가
	response.addCookie(cookie);
	
	Cookie c1 = new Cookie("name","소종원");
	response.addCookie(c1);
	
	Cookie c2 = new Cookie("id","Arin");
	c2.setMaxAge(60); //1분짜리 쿠키
	response.addCookie(c2);
	
	Cookie c3 = new Cookie("man","jjong");
	c3.setMaxAge(60*60); //1시간짜리 쿠키
	response.addCookie(c3);
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
	<h1>쿠키를 생성했습니다.</h1>
	<a href="viewCookie.jsp">viewCookie</a>
</body>
</html>