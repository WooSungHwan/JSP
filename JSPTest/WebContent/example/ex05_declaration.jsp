<%@page import="com.test.jsp.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="inc/asset.jsp" %>
<style>

</style>
<script>
	$(document).ready(function(){

	});
</script>
</head>
<body>
	<!-- ex05_declaration.jsp -->
	<%
	int a = 10;
	%>
	
	<p>a : <%= a %></p>
	
	<% 
	//현재 JSP 페이지가 서블릿 자바 클래스로 변환될 때 소속된 패키지와
	//MyUtil의 패키지가 다르다! -> import 해줘야함
	MyUtil util = new MyUtil(); 
	
	%>
	<p>num : <%= util.getNum() %></p>
	
	
	<%= request.getRequestURI() %>
	
	
	
	
</body>
</html>
<%!
int b= 20;
public void test(){
	//메서드 선언 가능
}
%>