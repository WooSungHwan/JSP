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
	<!-- ex26_session_set.jsp -->
	<%
		session.setAttribute("data", "홍길동");
		session.setAttribute("result", true);
		String[] list = {"강아지","고양이","자라"};
		session.setAttribute("list", list);
		
		
		//안내메시지 -> 서버이동 X 클라이언트이동O
		//response.sendRedirect("ex26_session.jsp");
		
		
		
	%>
	<script>
		alert("세션값을 저장했습니다.");
		location.href="ex26_session.jsp";
	</script>
</body>
</html>