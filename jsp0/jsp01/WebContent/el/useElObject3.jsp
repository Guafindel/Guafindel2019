<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name01", "requestData");
	session.setAttribute("name01","sessionData");
	application.setAttribute("name03", "applicationData");
%>
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
	<h3>		<!-- 속성 영역은 생략 가능. EL은 기본 제공하는 객체가 아니다. -->
		request 영역의 name01 : ${name01} <br>
							<%= request.getAttribute("name01") %> <br>
		session 역역의 name02 : ${sessionScope.name01} <br>
							
		application 영역의 name03 : ${name03} <br>
						<!-- 속성을 생략하면 속성을 찾게 되는데 그 순서는 아래와 같고 속성을 찾았다면 뒤의 속성을 확인하지 않는다.
							 만약 request를 찾았다면 session으로 찾는 과정을 하지 않는다는 말. -->
						<!-- 속성을 찾는 순서 page -> request -> session -> application -->
		code 파라미터 : ${param.code} <br>
		code 파라미터 : <%= request.getParameter("code") %> <br>
		contextPath : ${pageContext.request.contextPath} <br>
		contextPath : <%= request.getContextPath() %> <br>
		<a href="${pageContext.request.contextPath}">경로1</a><br>
		<a href="<%= request.getContextPath() %>">경로2</a><br>
	</h3>




</body>
<!-- 바디 끝 -->

</html>