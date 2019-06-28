<%@page import="web.Member"%>
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
<h1>c-page</h1>
	<h3>
		<%-- Page_c.jsp 에서 만들어진 응답 결과 
		<br> 
		no 파라미터의 값 : <%=request.getParameter("num")%>
		<br> 
		uname 파라미터의 값: <%=request.getParameter("username")%>
		--%>
		
		pageType = ${pageType} <br>
		pNo = ${pNo} <br>
		userName = ${userName}
		
		<br><br><br><br>
		
		<%
			Member member = (Member)request.getAttribute("result");
		
		%>
		<%= member %> <br>
		아이디 <%= member.getId() %> <br>
		이름 <%= member.getName() %> <br>
		번호 <%= member.getpNum() %> <br>
	</h3>
</body>
</html>