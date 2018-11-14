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
	<!-- ex26_session_del.jsp -->
	
	<%
	//세션 내의 원하는 속성값을 삭제(pageContext, request, application 동일)
	// - removeAttribute("name")
	
	session.removeAttribute("data");
	session.removeAttribute("result");
	session.removeAttribute("list");
	
	%>
	<script>
		alert("세션 데이터 삭제했습니다.");
// 		location.href="ex26_session.jsp";
		history.back();
		
	</script>
	
</body>
</html>