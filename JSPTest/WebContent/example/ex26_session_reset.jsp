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
	
	<!-- ex26_session_reset.jsp -->
	<%
	//세션 초기화????
	//	- 세션이 만들어진 직후 상태로 되돌린다.
	//	1. 데이터 전부 삭제
	//	2. 새 세션 객체 생성
	
	session.invalidate();
	
	
	%>
	<script>
		alert("세션 초기화");
		location.href="ex26_session.jsp";
	</script>
	
</body>
</html>