<%@page import="web.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String uname = request.getParameter("uname");
	String pType = request.getParameter("type");
	String no = request.getParameter("no");
	
	
	Member member = new Member(uname, pType, no);
	
	request.setAttribute("result", member);
	
	session.setAttribute("user", member);
	
	
	if(pType == null) {
		pType = "a";
	}
	
	if(no==null) {
		no = "0";
	}
	
	if(uname==null) {
		uname = "noname";
	}
	
	if(pType.equals("a")){
%>
	<jsp:forward page="page_a.jsp"/>
	request.getAttribute("result");
	
<% 
	} else if(pType.equals("b")) {
	%>
	<jsp:forward page="page_b.jsp"/>
	
		
	
<% 
	} else { 
%>
	<jsp:forward page="page_c.jsp"/>
	
		
	
<% 
	}
%>