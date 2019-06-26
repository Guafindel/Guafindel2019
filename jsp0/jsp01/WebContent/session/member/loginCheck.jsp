<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 저장되어 있는 로그인 ID를 받는다.
	//String id = (String)session.getAttribute("ID");
	LoginInfo loginInfo = (LoginInfo)session.getAttribute("LoginInfo");

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
	<h1>세션 로그인 체크 화면</h1>
	<%
		if(loginInfo != null) {
	%> 
	<h1><%= loginInfo.getName() %>님 로그인 상태입니다.</h1>
	<h3>
		id = <%= loginInfo.getId() %> <br>
		nickname = <%= loginInfo.getNickname() %> <br>
		grade = <%= loginInfo.getGrade() %> <br>
		photo = <%= loginInfo.getPhoto() %> <br>
		pNum = <%= loginInfo.getpNum() %> <br>
	</h3>
	
	<a href="logout.jsp">logout</a>
	<%	
		} else {
	%>
	<script>
		alert('로그인을 하셔야 확인할 수 있습니다.\n 로그인 페이지로 이동합니다.');
		location.href='loginForm.jsp';
	</script>
	<%
		}
	%>
</body>
<!-- 바디 끝 -->

</html>