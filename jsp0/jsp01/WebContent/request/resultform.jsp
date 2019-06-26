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
	<h1>request Form result</h1>
	<hr>
	<table>
		<tr>
			<td>이름</td>
			<td>
				<%= request.getParameter("uName") %>
				<!-- String -> int -->
				<!-- Integer.parse -->
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
				<% 
					String[] itr = request.getParameterValues("itr");
					
					if(itr != null){
						for(int i=0; i<itr.length; i++) {
							
							out.print(itr[i]+"   ");
						}
					}
				
				%>
			</td>
		</tr>
	</table>
</body>
</html>