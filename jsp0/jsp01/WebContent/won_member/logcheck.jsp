<%@page import="member.WonLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	WonLogin login = (WonLogin)session.getAttribute("logCheck");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 스크립트 삽입 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 제이쿼리 스크립트 삽입  -->
<!-- 스타일 시작 -->
<style>

</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>

	<% 
		if(logCheck != null) {
			
	%>
	<h3>회원 정보 저장 페이지.</h3>
	<hr>
			
	<%		
		}
	%>
</body>
<!-- 바디 끝 -->

</html>