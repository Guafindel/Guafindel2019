<%@page import="java.sql.SQLException"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="membermanager.model.RequestMemberInfo"%>
<%@page import="membermanager.model.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${logininfo eq null}">
	<script>
		alert('로그인 후 사용가능 페이지 입니다.');
		location.href = 'loginForm.do';
	</script>
</c:if>
<c:if test="${!(logininfo eq null)}">

	<!DOCTYPE html>
	<html>
<head>
<meta charset=UTF-8">

<title>Insert title here</title>

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일 링크 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 제이쿼리 링크 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<!-- 헤더 시작 -->
	<%@ include file="/WEB-INF/view/frame/header.jsp"%>
	<!-- 헤더 끝 -->

	<!-- 컨텐츠 시작 -->
	<div class="content">
		<div class="container">
			<h3 class="display-6">회원 가입 요청 처리 페이지</h3>
			<hr>
			<table class="table-bordered" style="width: 100%">
				<tr>
					<td>Index</td>
					<td>ID</td>
					<td>Name</td>
					<td>Password</td>
					<td>Picture</td>
					<td>Date</td>
					<td>비고</td>
				</tr>
				<!-- 리스트 반복 시작 -->
				<%
					Connection conn = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						System.out.println("");
						String sql = "SELECT * FROM member ORDER BY idx";

						try {
							conn = ConnectionProvider.getConnection();

							pstmt = conn.prepareStatement(sql);

							rs = pstmt.executeQuery();

							while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getInt("idx")%></td>
					<td><%=rs.getString("mId")%></td>
					<td><%=rs.getString("mPw")%></td>
					<td><%=rs.getString("mName")%></td>
					<td><img class="sumnail" alt="회원 사진"
						src="<c:url value='/uploadfile/${logininfo.mPhoto}'/>"></td>
					<td><%=rs.getString("regDate")%></td>
					<td><a href="#">수정</a> | <a href="#">삭제</a></td>
				</tr>
				<%
					}

						} catch (SQLException e) {
							e.printStackTrace();
						} finally {

						}
						if (rs != null) {
							try {
								pstmt.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
						if (pstmt != null) {
							try {
								pstmt.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
						if (conn != null) {
							try {
								conn.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
				%>
			</table>

		</div>
	</div>
	<!-- 컨텐츠 끝 -->

	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/view/frame/footer.jsp"%>
	<!-- 푸터 끝 -->


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

	</html>
</c:if>