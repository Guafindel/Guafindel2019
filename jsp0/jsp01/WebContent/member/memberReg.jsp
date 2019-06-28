<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("utf-8");
%>
<!-- usebean 액션 태그를 이용한 객체 생성 (먼저 찾고, 없으면 생성한다. -->
<jsp:useBean id="memberInfo" class="member.MemberInfo" scope="session"/>
<!-- 생성된 객체에 데이터 바인딩 : 폼의 name 속성과 beans 클래스의 변수 이름이 동일해야 한다. -->
<jsp:setProperty property="*" name="memberInfo"/>

<%
	if(memberInfo.getuPhoto() == null) {
		memberInfo.setuPhoto("noImg.jpg");
	}


	application.setAttribute(memberInfo.getuId(), memberInfo);
%>
<%
	/* String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pnum = request.getParameter("pnum");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String photo = request.getParameter("photo");
	String pw = request.getParameter("pw"); */
	
	/* boolean signupChk = false; */
	
	/* if(id != null && pw !=null && id.equals(pw)) {
		
		MemberLogin memberLogin = new MemberLogin(id, name, pnum, email, photo, address);
		
		session.setAttribute("SignUp", memberLogin);
		
		signupChk = true;
	}
	
	MemberLogin memberLogin = (MemberLogin)session.getAttribute("SignUp"); */
	
	
	

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
	.mInfor {
		border : 2px solid #ddd;
		box-shadow: 1px 1px 3px #EEE;
		padding : 10px;
		
		}
</style>
<!-- 스타일 끝 -->

</head>
<body>


<%-- <%
	request.setCharacterEncoding("utf-8");	

	String userId = request.getParameter("uId");
	String userPw = request.getParameter("uPw");
	String userName = request.getParameter("uName");

%> --%>

	<!-- 헤더 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- 헤더 끝 -->

	<!-- 네비게이션 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- 네이게이션 끝 -->

	<!-- 컨테이너 시작 -->
	<div id="container">
		<h3>회원 가입 요청 처리 페이지</h3>
		<%-- ${sessionScope.memberInfo} --%>
		
		<hr>
		
			<table>
				<tr>
					<td>아이디(이메일)</td>
					<td><input type="email" name="id" value="<%=/* userInfo.getId() */ memberInfo.getuId() %>"></td>
					<td><input type="email" name="id" value="${memberInfo.uId}"></td>
				</tr>
				<!-- /* userInfo.getPw() */ -->
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= /* userInfo.getName() */memberInfo.getuName() %>"></td>
					<td><input type="text" name="name" value="${memberInfo.uName}"></td>
				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" name="photo" value="<%= memberInfo.getuPhoto()%>"></td>
					<td><input type="file" name="photo" value="${memberInfo.uPhoto}"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
		
	</div>
	<!-- 컨테이너 끝 -->

	<!-- 푸터 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- 푸터 끝 -->



</body>
</html>