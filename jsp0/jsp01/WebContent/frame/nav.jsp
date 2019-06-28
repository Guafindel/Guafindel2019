<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<div id="nav">
		<ul>
			<li><a href="<c:url value='/' />">홈</a></li>
			<li><a href="<c:url value='/member/login.jsp' />">로그인</a></li>
			<li><a href="<c:url value='/member/memberRegForm.jsp' />">회원가입</a></li>
			<li><a href="<c:url value='/member/myPage.jsp' />">회원 정보1</a></li>
			<li><a href="<c:url value='/member/myPage2.jsp' />">회원 정보2</a></li>
			<li><a href="<c:url value='/member/logout.jsp' />">로그아웃</a></li>
			<li><a href="<c:url value='/member/memberList.jsp' />">회원리스트1</a></li>
			<li><a href="<c:url value='/member/memberList2.jsp' />">회원리스트2</a></li>
		</ul>
	
	
	
		<%-- <ul>
			<li><a href="${pageContext.request.contextPath}">홈</a></li>
			<li><a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/member/memberRegForm.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/member/myPage.jsp">회원 정보</a></li>
			<li><a href="${pageContext.request.contextPath}/member/logout.jsp">로그아웃</a></li>
			<li><a href="${pageContext.request.contextPath}/member/memberList.jsp">회원리스트</a></li>
		</ul> --%>
	</div>