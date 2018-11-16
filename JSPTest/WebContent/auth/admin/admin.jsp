<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//비회원 || 일반회원 거절!!
	if(session.getAttribute("id")==null || !session.getAttribute("lv").toString().equals("2")){
		
%>
<script>
	alert("접근금지");
	location.href='../index.jsp';
</script>
<%
		//response.sendRedirect(application.getContextPath()+"/index.jsp");
		System.out.println(application.getContextPath());
		
	}
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../inc/asset.jsp" %>
<style>

</style>
<script>
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	<!-- 관리자 전용 페이지 -->
	<div class="container">
		<h1 class ="page-header">관리자 전용 페이지</h1>
	</div>
</body>
</html>