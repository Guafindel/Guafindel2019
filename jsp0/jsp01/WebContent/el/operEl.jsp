<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<h3>	
		수치 연산 <br>
		${10-1} , ${10+20} , ${10*10} , ${10 / 2} , ${10/3} , ${10%3} , ${10 % 2}	<br>
		${10-1} , ${10+20} , ${10*10} , ${10 /2} , ${10 /3}, ${10 mod 3} , ${10 mod 2}	<br>
		<br><br>
		
		비교 연산 <br>
		${1 == 1}, ${10 != 10}, ${10>1}, ${10<1}, ${10>=1}, ${10<=1}	<br>
		${1 eq 1}, ${10 ne = 10}, ${10 gt 1}, ${10 lt 1}, ${10 ge 1}, ${10 le 1}	<br>
		
		<br><br>
		논리 연산 <br>
		${true && true}, ${true || false}, ${! true} <br>
		${true and true}, ${true or false}, ${not true} <br>
		
	</h3>

</body>
<!-- 바디 끝 -->

</html>