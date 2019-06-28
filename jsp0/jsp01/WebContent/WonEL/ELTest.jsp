<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	request.setAttribute("id","kimch");
	session.setAttribute("id2", "leesh");
	application.setAttribute("id3", "park");
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
			String aa = (String)request.getAttribute("id");
		%>
		
		<%= aa %><br>
		${requestScope.id}<br>
		${sessionScope.id2}<br>
		${applicationScope.id3}<br>
		
		<hr>
		IPAddress : ${initParam.ipAdress}
		
		<form method="get" action="ELTest2.jsp"><br>
			name: <input type="text" name="name"><br>
			address <input type="text" name ="address">
			<input type="submit" value="넘어가기">
		</form>
</body>
<!-- 바디 끝 -->

</html>