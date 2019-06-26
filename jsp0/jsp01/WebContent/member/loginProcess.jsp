<%@page import="member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<% 
 	String userId = request.getParameter("uId");
	String userPw = request.getParameter("uPw");
	
	/* boolean loginChk = false; */
	
	 /* 
		 1. 사용자가 입력한 id로 회원 정보 검색
		 2. 존재한다 : 해당 객체를 받는다.
	 			 	 해당 객체의 pw와 사용자가 입력한 pw를 비교
	 				 같다면 - 로그인 처리 : 세션 영역에 회원 정보를 저장
	 			 	 틀리다 - 오류 메시지 전달 -> 로그인 페이지로 이동
	 	 3. 존재하지 않는다 : 오류 메세지 전달 -> 로그인 페이지로 이동			 
	 */
	 
	 //1. 사용자가 입력한 id로 회원 정보 검색
	 MemberInfo memberInfo = (MemberInfo)application.getAttribute(userId);
	 	 
	 	 
	 if(memberInfo != null && memberInfo.getuPw().equals(userPw)) {
		 //회원 정보가 존재
		 //세션에 회원 로그인 정보를 저장.
		 session.setAttribute("loginInfo", memberInfo.toLoginInfo());
		 
		 response.sendRedirect(request.getContextPath());
	 
	 } else {
		 //id 검색결과가 null 또는 pw 비교에서 같지 않은 경우
		 
		 %>
		 <script>
		 	alert('아이디 혹은 비밀번호가 틀렸습니다. \n다시 로그인 해주세요.');
		 	history.go(-1);
		 </script>
		 <%		 
	 }
	%>
	
	<!-- /*  if(userId != null && userPw != null && userId.equals("admin") && userPw.equals("admin")) {
		response.sendRedirect(request.getContextPath()); // /mm
	} */  -->


<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery CDN 1.12.4 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="/jsp01/css/default.css" rel="stylesheet" type="text/css">

<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<body>




	
	<!-- 헤더 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- 헤더 끝 -->

	<!-- 네비게이션 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- 네이게이션 끝 -->

	<!-- 컨테이너 시작 -->
	<div id="container">
		<h3>로그인 요청 처리 페이지.</h3>
		<hr>
		
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value="<%= /* userInfo.getId() */%>"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="pw" value="<%= /* userInfo.getPw() */%>"></td>
				</tr>
				<tr>
					<td></td>
					<td> </td>
				</tr>
			</table>
		
	</div>
	<!-- 컨테이너 끝 -->

	<!-- 푸터 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- 푸터 끝 -->

<jsp:useBean id="loginInfo" class="member.MemberInfo" scope="session"/>
<jsp:setProperty property="id" name="loginInfo" value="<%= userInfo.getId()  %>"/>

<%
	loginInfo.setPw(userInfo.getPw());
%>
</body>
</html>  --%>