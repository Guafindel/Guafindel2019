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
	request.setAttribute("code", "code-0");
	request.setAttribute("name", request.getParameter("name"));
	request.setAttribute("type", "A-Type");
%>


<%
	request.setCharacterEncoding("utf-8");
%>
	<h1>action_forward / response sendRedirect</h1>
	<form action="action_forward.jsp">
		forward action <input type="text" name="name"> <input type="submit">
	</form>
</body>
</html>


<jsp:forward page="form3_result.jsp"/>







