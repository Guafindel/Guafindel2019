<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="signUp" class="jdbc.Sign" scope="session" />
<jsp:setProperty property="*" name="signUp" />
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		//1. 드라이버로드
		//2. DB연결
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";

		conn = DriverManager.getConnection(jdbcDriver);
		//3. Statement 객체 생성
		//사용자 정보 업데이트를 위한 SQL 작성
		stmt = conn.createStatement();

		//SQL문 작성
		String sql = "select * from memberinfo order by idx";

		//4. SQL 실행
		rs = stmt.executeQuery(sql);
%>
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
	<div class="container-fluid">
		<h1 class="display-4">SignUp</h1>
		<hr>
		<br>
		<div class="row">
			<div class="col-sm-2">
				<a href="Form.jsp">홈</a>
			</div>
			<div class="col-sm-2">
				<a href="signForm.jsp">회원가입</a>
			</div>
			<div class="col-sm-2">
				<a href="#">로그인</a>
			</div>
			<div class="col-sm-2">
				<a href="userInfo.jsp">회원 목록</a>
			</div>
			<div class="col-sm-2">
				<a href="#">회원 상세정보</a>
			</div>
		</div>
		<br>
		<h1 class="display-4">회원 목록</h1>
		<br>
		<%
			//5. 결과출력
				while (rs.next()) {
		%>
		<table>
			<tr>
				<td><%=rs.getInt(1)%></td>
				<td><a href="viewUser.jsp?idx=<%=rs.getString(2)%>"><%=rs.getString(2)%></a></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getDate(6)%></td>
			</tr>
		</table>
		<%
			}
		%>
	</div>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>
<%
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {
		//6. 사용객체 close() :rs, stmt, pstmt, conn
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {

			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {

			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {

			}
		}
	}
%>