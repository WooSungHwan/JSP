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
	<!-- ex10_method_two.jsp -->
	
	<h1>두번째 페이지</h1>
	
	<p>현재 페이지가 어떤 방식으로 요청을 당했는지? : doGet() or doPost() 호출 결정</p>
	<p><%= request.getMethod() %></p>
	
</body>
</html>