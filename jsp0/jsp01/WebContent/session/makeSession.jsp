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
 request.setCharacterEncoding("utf-8");
%>
	<h1>session을 이용한 데이터 저장</h1>
	
	<%
		//session.setAttribute("name","object");
		session.setAttribute("name", "KING");
		session.setAttribute("id", "tiger");
		session.setAttribute("isLogin", true);
		session.setAttribute("age", 20);
	
	%>
	<h3>세션에 데이터를 저장했습니다.</h3>


	<a href="viewSession.jsp">viewSession1</a> <br>
	
	<a href="../request/viewSession.jsp">RequestViewSession2</a> <br>
	
	<a href="logout.jsp">logoutSession</a>" <br>

</body>
</html>