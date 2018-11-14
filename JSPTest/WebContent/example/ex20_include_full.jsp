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
		<h1 class ="page-header">전체페이지</h1>
		
		<h2>include 지시자</h2>
		
		<%@ include file="ex20_include_part.jsp" %>
		
		
		<h2>include 액션 태그</h2>
		
		<jsp:include page="ex20_include_part.jsp"></jsp:include>
		
		
	</div>
</body>
</html>