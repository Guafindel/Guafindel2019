<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	request.getSession(false).invalidate();
%>
	<h1>로그아웃 했습니다.</h1>
	
	<a href="viewSession.jsp">viewSession1</a> <br>
	
	<a href="../request/viewSession.jsp">RequestViewSession2</a> <br>





</body>
</html>