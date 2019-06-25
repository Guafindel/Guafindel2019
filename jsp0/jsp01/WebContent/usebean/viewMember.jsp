<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userData" class="member.UserInfo" scope="request"/>

<!-- 
	request.getAttribute("userData")
 -->
 
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
<h1>포워드 된 페이지 이며, usebean을 통한 데이터 공유입니다.</h1>
<h1>
	<%= userData %>
</h1>
</body>
</html>