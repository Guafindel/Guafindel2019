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
		session = request.getSession(false);
	%>
	
	name : <%= session.getAttribute("name") %> <br>
	id : <%= session.getAttribute("id") %> <br>
	isLogin : <%= session.getAttribute("isLogin") %> <br>
	age : <%= session.getAttribute("age") %> <br>
	
	
	
	
	
	
	
	






</body>
</html>