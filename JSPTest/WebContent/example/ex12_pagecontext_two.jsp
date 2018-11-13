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
	<!-- ex12_pagecontext_two.jsp -->
	
	<h1>두번째 페이지</h1>
	
	<p>첫번째 페이지의 데이터 : <%= request.getAttribute("num") %></p>
	
	
</body>
</html>