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
	h1 {
		text-align: center;
	}
	
	table {
		width: 500px;
		border: 0;
		border-collapse: collapse; 
		margin: 0 auto;
	}
	
	td {
		border: 1px solid #DDD;
		padding: 10px;
	}
	
	select {
		height: 25px;
	}
	
	table tr:last-child>td {
		text-align: center;
	}
	
	table tr:first-child>td:first-child {
		width : 75px;
	}
</style>
<!-- 스타일 끝 -->

</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

	<h1>request Form Test</h1>
	<hr>
	<form action="resultform.jsp" method="post">
	<table>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="uName">
			</td>
		</tr>
		<tr>
			<td>직업</td>
			<td>
				<select name="job">
					<option>직업</option>
					<option>백조</option>
					<option>백수</option>
					<option>프로그래머</option>
					<option>프로게이</option>
					<option>시스템엔지니어</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>관심분야</td>
			<td>
				<input type="checkbox" name="itr" value="Java"> Java
				<input type="checkbox" name="itr" value="HTML5"> HTML5
				<input type="checkbox" name="itr" value="CSS3"> CSS3
				<input type="checkbox" name="itr" value="JavaScript"> JavaScript
				<input type="checkbox" name="itr" value="JSP"> JSP
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인">
				<input type="reset">
			</td>
			
		</tr>
	</table>
	</form>
</body>
</html>