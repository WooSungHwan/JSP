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
	
	<!-- ex26_session_interval.jsp -->
	<% 
		//현재 사용자의 만료시간만 30초로 재지정
		// - 이 페이지를 접근 안한 다른 사용자는 여전히 30분
	
		session.setMaxInactiveInterval(30);
	
	%>
	<script>
		alert("만료 시간 재지정(30초)");
		location.href="ex26_session.jsp";
	</script>
	
</body>
</html>