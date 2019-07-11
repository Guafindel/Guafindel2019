<%@page import="java.sql.PreparedStatement"%>
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
	PreparedStatement pstmt = null;
	int resultCnt = 0;

	try {
		//1. 드라이버로드
		//2. DB연결
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";

		conn = DriverManager.getConnection(jdbcDriver);
		//3. PreparedStatement 객체 생성
		//사용자 정보 업데이트를 위한 SQL 작성
		String sql = "insert into MemberInfo (idx, mId, mPx, mName, mPhoto) values(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, signUp.getIdx());
		pstmt.setString(2, signUp.getmId());
		pstmt.setString(3, signUp.getmPx());
		pstmt.setString(4, signUp.getmName());
		pstmt.setString(5, signUp.getmPhoto());

		//4. SQL 실행
		resultCnt = pstmt.executeUpdate();
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
		<h1 class="display-4">회원가입 처리</h1>
		<br>
		<div>
			<h1>
				회원가입<small>확인 했습니다.</small>
			</h1>
			<h1><%=resultCnt%><small>개의 사원 정보를 입력했습니다. </small>
			</h1>
			<hr>
		</div>

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
		if (pstmt != null) {
			try {
				pstmt.close();
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