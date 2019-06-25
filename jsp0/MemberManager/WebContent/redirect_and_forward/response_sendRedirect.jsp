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
	<h1>action_forward / response sendRedirect</h1>
	
	<form action="response_sendRedirect">
		response sendRedirect <input type="text" name="name"> <input type="submit">
	</form>
</body>
</html>
<% 
	request.setAttribute("code", "code-1");

	String name = request.getParameter("name");
	response.sendRedirect("form3_result.jsp?type=B-Type&name="+name );
%>









