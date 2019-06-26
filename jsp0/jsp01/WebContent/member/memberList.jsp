<%@page import="member.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Enumeration<String> e = application.getAttributeNames();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery CDN 1.12.4 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="/jsp01/css/default.css" rel="stylesheet" type="text/css">

<!-- 스타일 시작 -->
<style>
	img.sumnail {
		height : 25px;
		margin : 2px;
	}
	img.sumnail:hover {
		width : 200px;
		height : 200px;
	}
	
	table {
		width : 80%;
		margin : 0 auto;
		border : 0;
		border-collapse: collapse;
		
	}
	
	table td {
		padding : 3px;
		/* text-align: center; */
		border : 1px solid #AAA;
	}
	
	table tr:first-child>td {
		text-align:center;
		background-color : #EEE;
		font-weight : 600;
	}
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
		<h3>회원 리스트 페이지 입니다.</h3>
		<hr>
		<table>
			<tr>
				<td>순번</td>
				<td>아이디</td>
				<td>이름</td>
				<td>비밀번호</td>
				<td>사진</td>
				<td>등록 시간</td>
			
			</tr>
			<!-- 리스트 반복 시작 -->


			<%
				
				int cnt = 0;
			
				while (e.hasMoreElements()) {

					String name = e.nextElement();

					Object obj = application.getAttribute(name);

					if (obj instanceof MemberInfo) {
						MemberInfo member = (MemberInfo)obj;
						%>
			<tr>
				<td><%= ++cnt %></td>
				<td><%=member.getuId() %></td>
				<td><%=member.getuName() %></td>
				<td><%=member.getuPw() %></td>
				<td><img class="sumnail" alt="회원 사진" src="../images/<%=member.getuPhoto()%>"></td>
				<td><a href="#">수정</a> | <a href="#">삭제</a></td>
			</tr>
						<%
				}
			%>

			<%
				}
			%>




			<!-- 리스트 반복 종료 -->

		</table>
	</div>
	<!-- 컨테이너 끝 -->

	<!-- 푸터 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- 푸터 끝 -->



</body>
</html>