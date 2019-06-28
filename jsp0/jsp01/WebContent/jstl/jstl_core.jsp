<%@page import="java.util.ArrayList"%>
<%@page import="member.WonLogin"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<WonLogin> list = new ArrayList<WonLogin>();

	list.add(new WonLogin("Arin","최아린","010-7934-1811"));
	list.add(new WonLogin("Arin2","최아린2","010-7934-1812"));
	list.add(new WonLogin("Arin3","최아린3","010-7934-1813"));
	list.add(new WonLogin("Arin4","최아린4","010-7934-1814"));
	list.add(new WonLogin("Arin5","최아린5","010-7934-1815"));
	list.add(new WonLogin("Arin6","최아린6",null));
	list.add(new WonLogin("Arin7","최아린7","010-7934-1817"));
	list.add(new WonLogin("Arin8","최아린8","010-7934-1818"));
	list.add(new WonLogin("Arin9","최아린9","010-7934-1819"));
	list.add(new WonLogin("Arin10","최아린10","010-7934-1820"));
	
	application.setAttribute("login", list);
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

	.nopNum {
		color : red;
	}
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>

	<c:url value="/member/list.jsp" var="uri_mList">
		<c:param name="pno" value="5"/>
	</c:url>
	
	<h3>단순 출력 : ${uri_mList}</h3>
	<h3>링크 연동 : <a href="${uri_mList}">리스트</a></h3>
	<h3>링크 연동2 : <a href='<c:url value="/member/list.jsp"></c:url>'>리스트2</a></h3>
	
	<c:set value="test" var="msg"/>
	msg :${msg} <br>
	
	<c:if test="${msg eq 'test'}">
		
		msg의 문자열은 test와 같습니다.
	
	</c:if>
	
	<c:if test="${msg eq 'test'}" var="condition" />
	
	<br>
	결과값은 : ${condition}
	
	
	<hr>
	
	
	<h1>
		<c:out value="arin"/><br>
		<c:out value="${param.code}" default="" /><br>
		<c:out value="${param.code}" default="c" /><br>

		<c:out value="${param.code}" escapeXml="false"> 
			<span style="color:red">d</span>
		</c:out> <br>
	</h1>
	<table>
		<tr>
			<td>index/count</td>
			<td>아이디</td>
			<td>이름</td>
			<td>휴대전화</td>
		</tr>
		<c:forEach items="${login}" var="login" varStatus="status" begin="0" end="5">
		<tr>
			<td>${status.index} / ${status.count}</td>
			<td>${login.uId}</td>
			<td>${login.uName}</td>
			<td>
				<c:out value="${login.pNum}" escapeXml="false">
				<!-- escapeXml은 작성한 값을 html형식으로 나타내게 해준다. -->
					<span class="nopNum">전화번호 없음</span>
				</c:out>
			</td>
		</tr>
		</c:forEach>
		
		<c:forTokens items="Arin, 최아린, 010-7934-1818" delims="," var="sel">
			${sel} <br>
		</c:forTokens>
		
		
		
	</table>


	



</body>
<!-- 바디 끝 -->

</html>