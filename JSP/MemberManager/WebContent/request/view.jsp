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
	* {
	border: 0;
	padding: 0;
	}
	footer>span {
		margin: 0 auto;
	}

	h1 {
	text-align: center;
	}

	hr {
	border: 0;
	margin: 20px 0;
	border-bottom: 1px solid #333;
	}

	table {
	border: 0;
	border-collapse: collapse;
	margin: 0 auto;
	}

	td {
	border: 1px solid #333;
	padding: 10px;
	}

	tr:last-child>td {
	text-align: center;
	}

	select {
	height: 25px;
	}
</style>
<!-- 스타일 끝 -->

</head>
<body>
	<div id="header">
		<h1>request 테스트 폼</h1>
		<hr>
	</div>
	<div id="container">
		<form method="post" action="viewform.jsp">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="uName"></td>
				</tr>
				<tr>
					<td>직업</td>
					<td><select name="job">
							<option>직업</option>
							<option>무직</option>
							<option>프로그래머</option>
							<option>학생</option>
					</select></td>
				</tr>
				<tr>
					<td>관심분야</td>
					<td>
						<input type="checkbox" value="LOL" name="itr"> LOL 
						<input type="checkbox" value="StarCraft" name="itr"> StarCraft
						<input type="checkbox" value="Stone" name="itr"> Stone
						<input type="checkbox" value="PinBall" name="itr"> PinBall
						<input type="checkbox" value="Fafa" name="itr"> Fifa
						</td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="input" type="submit" value="확인">
						<input class="input" type="submit" value="취소">
					</td>
					
				</tr>
			</table>
		</form>
	</div>
	<div id="footer">
		<span>no one has copyright</span>
	</div>
</body>
</html>