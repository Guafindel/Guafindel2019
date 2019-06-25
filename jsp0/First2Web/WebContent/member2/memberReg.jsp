<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = new String("회원가입 폼");



 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- jQuery CDN 1.12.4 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 스타일 시작 -->
<style>
	img {
		width: 800px;
		
	}
</style>
<!-- 스타일 끝 -->

</head>
<body>
<h1><%= str %></h1>
<a href="/web/member/list.jsp">회원 리스트</a><br>
<img alt="이미지" src="/web/images/i15248516877.jpg">

<script>
	$(document).ready(function(){
		alert('회원 가입페이지예요.');
		
	});

</script>
</body>
</html>