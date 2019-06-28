<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctgy = request.getParameter("ctgy");

	if(ctgy == null) {
		ctgy = "1";
	}
	
	
%>
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
		margin: 0;
		padding: 0;
	}
	#wrap {
		border: 1px solid #ddd;
		
		width: 800px;
		padding: 10px;
		margin :10px auto;
	}
	#container {
		overflow: hidden;
	}
	#container>div {
		float:left;
	}
	#aside {
		height : 200px;
		background-color: #fd79a8;
	}
	#footer {
		border: 1px solid #ddd;
		height : 50px;
	}
	#menu {
		width: 200px;
	}


</style>
<!-- 스타일 끝 -->

</head>
<body>
	<div id="wrap">
	
	<div id="header">
		<h1>title</h1>
	</div>
	
	<div id="container">
		<div id="menu">
			<jsp:include page="menu.jsp">
				<jsp:param value="<%= ctgy %>" name="ctgy"/>
			</jsp:include>
		</div>
		<div id="aside"><p>sidemenu</p></div>
	</div>
	<div id="footer"></div>
	
	</div>
	


</body>
</html>