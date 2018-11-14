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
	
	<div class="container">
		<h1 class ="page-header">Session vs Application</h1>
		
		<%
		//데이터 저장
		//- session,application 변수
		//		: 전역변수(모든 페이지에서 접근이 가능하다.)
		//- 차이점 
		//	- session : 개인 전용  | application : 모든유저 공용
		
		session.setAttribute("num",10);
		application.setAttribute("name","홍길동");
		%>
		
		<p>session : <%= session.getAttribute("num") %></p>
		<p>application : <%= application.getAttribute("name") %></p>
		
		<a href="ex16_session_two.jsp">두번째 페이지</a>
		
		
	</div>
</body>
</html>