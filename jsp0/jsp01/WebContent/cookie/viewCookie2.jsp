<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CookieBox cBox = new CookieBox(request);
	//브라우저가 서버로 요청할 때 모든 쿠키 정보를 함께 전송
	/* Cookie[] cookies = request.getCookies(); */
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
	
	<h1>Cookie Data</h1>	
	
	
	
	<h3>
	 name: <%=cBox.getValue("name") %> <br>
	 nickname : <%= cBox.getValue("nickname") %> <br>
	 pw :<%=cBox.getValue("pw") %>
	</h3>
	
	
	<a href="editCookie2.jsp">editCookie</a> <br>
	<a href="deleteCookie2.jsp">deleteCookie</a>
</body>
</html>