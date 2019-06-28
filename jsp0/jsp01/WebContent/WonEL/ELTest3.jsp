<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%!
	public class Inner {
		private String data;
		public void setData(String data) {this.data=data;}
		public String getData() {return this.data; }
		
}
%>
<%
	Inner inner = new Inner();
	inner.setData("소종원");
	request.setAttribute("inner", inner);
	
	request.setAttribute("su1", "100");
	request.setAttribute("su2", "100");
	
	request.setAttribute("bool", "false");
	request.setAttribute("data", "");
	
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
	inner.data : ${requestScope.inner.data }<br>
	su1 *(su2+3) : ${requestScope.su1 *(requestScope.su2+3) }<br>
	not bool : ${not requestScope.bool }<br>
</body>
<!-- 바디 끝 -->

</html>