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
		<h1 class ="page-header">두번째 페이지</h1>
		
		<%-- <p>지역변수 : <%= a%></p> --%>
		<%-- <p>멤버변수 : <%= b%></p> --%>
		<p>pageContext : <%= pageContext.getAttribute("c")%></p>
		<p>request : <%= request.getAttribute("d")%></p>
		<p>session : <%= session.getAttribute("e")%></p>
		<p>application : <%= application.getAttribute("f")%></p>
		
		
		
	</div>
</body>
</html>