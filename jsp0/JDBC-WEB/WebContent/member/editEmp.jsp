<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	
	System.out.println(empno);
	System.out.println(ename);
	
	int eno = Integer.parseInt(empno);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;
	
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "tiger";
			
	try {
	//1. 데이터베이스 로드
	//Class.forName("oracle.jdbc.driver.OracleDriver");
				 
	
	//2. 데이터베이스 연결
	conn = DriverManager.getConnection(jdbcUrl, user, pw);
	
	//3. PreparedStatement 객체 생성
	
	//사용자 정보 업데이트를 위한 SQL 작성
	String sql = "update emp set ename=? where empno=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, ename);
	pstmt.setInt(2, eno);
	
	//4. SQL 실행
	resultCnt = pstmt.executeUpdate();
	
	
	//5. 실행결과 출력 확인 : 수정되었습니다.
	} catch (SQLException se){
		se.printStackTrace();
	} finally {
		//6. 객체 CLOSE()
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
	
	<h1 class=display-4>사원 정보 수정</h1>
	<h3><%= resultCnt %>개 행이 처리(수정 되었습니다.)</h3>
	

<!-- 부트스트랩 js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>