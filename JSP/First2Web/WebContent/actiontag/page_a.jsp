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
	<h1>
		Page_a.jsp 에서 만들어진 응답 결과 
		<br>
		no 파라미터의 값 : <%=request.getParameter("num")%>
		<br>
		uname 파라미터의 값: <%=request.getParameter("username")%>
	</h1>
</body>
</html>