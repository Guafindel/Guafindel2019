<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="EmpInfo" class="member.Emp" scope="session"/>
<jsp:setProperty property="*" name="EmpInfo"/>
<%


	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;
	
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user ="scott";
	String pw ="tiger";
	
	
	try{
		//1. 드라이버 로드
		//Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//2. DB 연결 : 커넥션
		conn = DriverManager.getConnection(jdbcUrl, user, pw);
		
		//3. PreparedStatement 객체 생성
		//사용자 정보 업데이트를 위한 SQL 작성
		String sql = "insert into emp (empno, ename, job) values(?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, EmpInfo.getEmpno());
		pstmt.setString(2, EmpInfo.getEname());
		pstmt.setString(3, EmpInfo.getJob());
		
		//4. SQL 실행
		resultCnt = pstmt.executeUpdate();
		
		/* if(resultCnt > 0) {
			System.out.println("새로운 사원 정보를 입력했습니다.");
			System.out.println("---------------------------");
		} */
		

%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">

<title>Insert title here</title>

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 제이쿼리 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	
	<div class="container-fluid">
		<h1 class="display-4">사원 입력 처리</h1>
		<h1 class=display-4"><%= resultCnt %>개의 새로운 사원 정보 입력했습니다.</h1>
		<a href="empList.jsp">EMP LIST</a>
	
			

<!-- 부트스트랩 js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>

<% 
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {
		//6. 사용객체 close() :rs, stmt, pstmt, conn
		if(pstmt != null) {
			try{
			pstmt.close();
			} catch (SQLException e) {
				
			}
		}
		if(conn != null) {
			try{
			conn.close();
			} catch (SQLException e) {
				
			}
		}
	}
%>