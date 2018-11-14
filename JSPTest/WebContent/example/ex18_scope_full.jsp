<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//1. 지역변수
int a = 10;


%>    
<%!
//2. 멤버변수
int b =20;
%>
<%
//3. 
pageContext.setAttribute("c", 30);

//4.
request.setAttribute("d", 40);

//5. 
session.setAttribute("e", 50);

//6.
application.setAttribute("f", 60);
%>
    
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
	
	<div class="container">
		<h1 class ="page-header">내장객체 생명주기</h1>
		
		<p>내용입니다.</p>
		<p>내용입니다.</p>
		<p>내용입니다.</p>

		<%@ include file="ex18_scope_part.jsp" %>
		
		<p>내용입니다.</p>
		<p>내용입니다.</p>
		<p>내용입니다.</p>
		
		
		
		
	</div>
</body>
</html>