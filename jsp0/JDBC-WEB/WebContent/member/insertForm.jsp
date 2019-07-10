<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">

<title>Insert title here</title>

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 제이쿼리 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<div class="container-fluid">
		<h1 class="display-4">사원 입력</h1>
		<hr>
		<form action="insertMember.jsp" method="post">
		<table>
			<tr>
				<td>사원번호</td>
				<td><input type="number" name="empno" required></td>
			</tr>
			
			<tr>
				<td>사원이름</td>
				<td><input type="text" name="ename" required></td>
			</tr>
		
			<tr>
				<td>담당직무</td>
				<td><input type="text" name="job" required></td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
				
			</tr>
		</table>
		</form>
	</div>
	

<!-- 부트스트랩 js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>