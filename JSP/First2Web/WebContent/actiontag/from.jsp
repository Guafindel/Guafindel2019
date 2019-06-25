<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page buffer="1kb" %>
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
	for(int i =0; i<10000; i++) {
%>
	<h1>from.jsp에서 실행된 결과 페이지 입니다.</h1>
<%
	}
%>	
	
	
	<jsp:forward page="to.jsp"></jsp:forward>
</body>
</html>