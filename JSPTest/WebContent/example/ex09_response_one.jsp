<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//비즈니스 업무 처리(DB)
//response.sendRedirect("ex09_response_two.jsp"); -> 이거만나면 해당 페이지로 바로 점프/ 라운드트립 1회


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
		location.href = "ex09_response_two.jsp";
	});
</script>
</head>
<body>
	<!-- ex09_response_one.jsp -->
	
	<h1>웹페이지 이동.</h1>
	
	<h2>1. HTML</h2>
	<ul>
		<li>&lt;a&gt; 사용</li>
		<li>브라우저 사용자가 직접 객체를 클릭</li>
	</ul>
	
	<h2>2. javascript</h2>
	<ul>
		<li>location.href 사용</li>
		<li>이벤트 매핑 : 브라우저 사용자가 직접 객체를 클릭(다양한 이벤트 발생)</li>
		<li>페이지 이동을 프로그램 제어를 통해서 실행</li>
	</ul>
	
	<h2>3. Servlet/JSP</h2>
	<ul>
		<li>response.sendRedirect(URL) 사용</li>
		<li>페이지 이동을 프로그램 제어를 통해서 실행</li>
	</ul>
	
</body>
</html>