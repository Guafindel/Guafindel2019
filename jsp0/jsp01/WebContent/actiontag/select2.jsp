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
	<form action="page2.jsp" method="get">
	
		no <input type="text" name="no" value="0">
		name <input type="text" name="uname">
		
		
		PAGE Type
		<select name="type">
			<option value="">선택하세요</option>
			<option value="a">A</option>
			<option value="b">B</option>
			<option value="c">C</option>
		</select>
		<input type="submit" value="보내기">
		
	
	</form>




</body>
</html>