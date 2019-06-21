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
<%
	request.setCharacterEncoding("utf-8");
%>

	<div id="header">
	<h1>request 요청 페이지</h1>
	<hr>
	</div>
	<div id="container">
	
		<table>
			<tr>
				<td>이름</td>
				<td>
					<%= request.getParameter("uName") %>
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<%= request.getParameter("job") %>
				</td>
			</tr>
			<tr>
				<td>관심분야</td>
				<td>
					<!--<%= request.getParameter("itr") %>  -->
					<% 
						String[] itr = request.getParameterValues("itr");
						if(itr != null) {
							for(int i = 0; i<itr.length; i++) {
								out.print(itr[i]+"\t");
							}
						}
					%>
					
				</td>
			</tr>
		</table>
	
	</div>
	<div id="footer">
	<span>no one has copyright</span>
	</div>
</body>
</html>